part of 'edit_doctor_bloc.dart';

@freezed
class EditDoctorEvent with _$EditDoctorEvent {
  const factory EditDoctorEvent.started() = _Started;

  const factory EditDoctorEvent.editDataDoctor(DoctorRequestModel doctor) = _EditDataDoctor;
}