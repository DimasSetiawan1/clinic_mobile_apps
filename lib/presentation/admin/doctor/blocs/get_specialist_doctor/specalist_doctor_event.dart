part of 'specalist_doctor_bloc.dart';

@freezed
class SpecalistDoctorEvent with _$SpecalistDoctorEvent {
  const factory SpecalistDoctorEvent.started() = _Started;

  const factory SpecalistDoctorEvent.getSpecalist() = _getSpecialist;
}
