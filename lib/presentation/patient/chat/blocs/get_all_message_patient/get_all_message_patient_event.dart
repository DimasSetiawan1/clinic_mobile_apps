part of 'get_all_message_patient_bloc.dart';

@freezed
class GetAllMessagePatientEvent with _$GetAllMessagePatientEvent {
  const factory GetAllMessagePatientEvent.started() = _Started;
  const factory GetAllMessagePatientEvent.getAllMessage() = _GetAllMessage;
}