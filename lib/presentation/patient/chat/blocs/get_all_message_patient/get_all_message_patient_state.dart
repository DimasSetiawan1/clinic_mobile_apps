part of 'get_all_message_patient_bloc.dart';

@freezed
class GetAllMessagePatientState with _$GetAllMessagePatientState {
  const factory GetAllMessagePatientState.initial() = _Initial;
  const factory GetAllMessagePatientState.loading() = _Loading;
  const factory GetAllMessagePatientState.loaded(List<RoomChatResponseModel> messages) =
      _Loaded;
  const factory GetAllMessagePatientState.error(String message) = _Error;
}
