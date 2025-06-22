part of 'get_all_message_doctor_bloc.dart';

@freezed
class GetAllMessageDoctorState with _$GetAllMessageDoctorState {
  const factory GetAllMessageDoctorState.initial() = _Initial;
  const factory GetAllMessageDoctorState.loading() = _Loading;
  const factory GetAllMessageDoctorState.loaded(List<ChatRequestModel> messages) =
      _Loaded;
  const factory GetAllMessageDoctorState.error(String message) = _Error;
}
