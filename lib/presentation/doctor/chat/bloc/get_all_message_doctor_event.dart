part of 'get_all_message_doctor_bloc.dart';

@freezed
class GetAllMessageDoctorEvent with _$GetAllMessageDoctorEvent {
  const factory GetAllMessageDoctorEvent.started() = _Started;
  const factory GetAllMessageDoctorEvent.getAllMessage() = _GetAllMessage;
}