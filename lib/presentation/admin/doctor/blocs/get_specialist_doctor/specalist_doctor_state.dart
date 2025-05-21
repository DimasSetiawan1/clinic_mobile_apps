part of 'specalist_doctor_bloc.dart';

@freezed
class SpecalistDoctorState with _$SpecalistDoctorState {
  const factory SpecalistDoctorState.initial() = _Initial;
  factory SpecalistDoctorState.loading() = _Loading;
  factory SpecalistDoctorState.error(String error) = _Error;
  factory SpecalistDoctorState.success(List<SpecialistModel> doctors) = _Success;
}
