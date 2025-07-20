part of 'video_call_telemedis_bloc.dart';

@freezed
class VideoCallTelemedisEvent with _$VideoCallTelemedisEvent {
  const factory VideoCallTelemedisEvent.started() = _Started;
  const factory VideoCallTelemedisEvent.joinCall({
    required String channelName,
    required String token,
    required int id
  }) = _JoinCall;
  const factory VideoCallTelemedisEvent.userLeft() = _UserLeft;
}