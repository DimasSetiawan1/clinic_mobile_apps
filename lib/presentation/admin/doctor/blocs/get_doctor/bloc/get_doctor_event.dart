part of 'get_doctor_bloc.dart';

@freezed
class GetDoctorEvent with _$GetDoctorEvent {
  const factory GetDoctorEvent.started() = _Started;
  const factory GetDoctorEvent.getDoctor() = _getDoctor;
}