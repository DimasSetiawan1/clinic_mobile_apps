part of 'doctor_telemedis_bloc.dart';

@freezed
class DoctorTelemedisState with _$DoctorTelemedisState {
  const factory DoctorTelemedisState.initial() = _Initial;

  factory DoctorTelemedisState.loading() = _Loading;
  factory DoctorTelemedisState.loaded(List<User> doctors) = _Loaded;
  factory DoctorTelemedisState.error(String message) = _Error;
}
