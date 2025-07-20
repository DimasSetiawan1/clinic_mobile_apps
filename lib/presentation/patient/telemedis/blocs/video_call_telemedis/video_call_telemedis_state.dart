part of 'video_call_telemedis_bloc.dart';

@freezed
class VideoCallTelemedisState with _$VideoCallTelemedisState {
  const factory VideoCallTelemedisState.initial() = _Initial;
  const factory VideoCallTelemedisState.loading() = _Loading;
  const factory VideoCallTelemedisState.loaded(
    RtcEngine engine,
    int? remoteUid,
    bool? localUserJoined,
    int id,
  ) = _Loaded;

  const factory VideoCallTelemedisState.error() = _Error;
}
