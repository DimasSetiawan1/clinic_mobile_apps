import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'video_call_telemedis_event.dart';
part 'video_call_telemedis_state.dart';
part 'video_call_telemedis_bloc.freezed.dart';

class VideoCallTelemedisBloc
    extends Bloc<VideoCallTelemedisEvent, VideoCallTelemedisState> {
  late RtcEngine _rtcEngine;
  final String _appId = dotenv.env['AGORA_APP_ID']!;
  bool _localUserJoined = false;
  int? _remoteUid;
  VideoCallTelemedisBloc() : super(_Initial()) {
    on<_JoinCall>(_initAgora);
  }
  _initAgora(_JoinCall event, Emitter emit) async {
    try {
      emit(_Loading());
      try {
        await _rtcEngine.leaveChannel();
        await _rtcEngine.release();
      } catch (_) {}
      await [Permission.microphone, Permission.camera].request();

      _rtcEngine = createAgoraRtcEngine();

      await _rtcEngine.initialize(
        RtcEngineContext(
          appId: _appId,
          channelProfile: ChannelProfileType.channelProfileCommunication,
        ),
      );

      _rtcEngine.registerEventHandler(
        RtcEngineEventHandler(
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
            _localUserJoined = true;
            log("local user ${connection.localUid} joined");
            emit(_Loaded(_rtcEngine, _remoteUid, _localUserJoined, event.id));
          },
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            log("remote user $remoteUid joined");
            _remoteUid = remoteUid;
            emit(_Loaded(_rtcEngine, _remoteUid, _localUserJoined, event.id));
          },
          onUserOffline: (
            RtcConnection connection,
            int remoteUid,
            UserOfflineReasonType reason,
          ) {
            log("remote user $remoteUid left channel");
            _remoteUid = null;
            emit(_Loaded(_rtcEngine, _remoteUid, _localUserJoined, event.id));
          },
          onLeaveChannel: (RtcConnection connection, RtcStats stats) {
            log("local user ${connection.localUid} left channel");
            _localUserJoined = false;
            _remoteUid = null;
            emit(_Loaded(_rtcEngine, _remoteUid, _localUserJoined, event.id));
          },
          onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
            log(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token',
            );
            emit(_Loaded(_rtcEngine, _remoteUid, _localUserJoined, event.id));
          },
        ),
      );

      await _rtcEngine.setClientRole(
        role: ClientRoleType.clientRoleBroadcaster,
      );

      await _rtcEngine.enableVideo();

      await _rtcEngine.startPreview();

      await _rtcEngine.joinChannel(
        token: event.token,
        channelId: event.channelName,
        uid: event.id,
        options: const ChannelMediaOptions(
          channelProfile: ChannelProfileType.channelProfileCommunication,
        ),
      );
      emit(_Loaded(_rtcEngine, _remoteUid, _localUserJoined, event.id));
    } catch (e, s) {
      emit(_Error());
      log("Error initializing Agora: $e $s");
    }
  }

  @override
  Future<void> close() async {
    await _rtcEngine.leaveChannel();
    await _rtcEngine.release();
    log("Agora engine released");
    return super.close();
  }
}
