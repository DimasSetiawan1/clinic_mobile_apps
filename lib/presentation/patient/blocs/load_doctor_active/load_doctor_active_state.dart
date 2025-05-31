part of 'load_doctor_active_bloc.dart';

@freezed
class LoadDoctorActiveState with _$LoadDoctorActiveState {
  const factory LoadDoctorActiveState.initial() = _Initial;

  const factory LoadDoctorActiveState.loading() = _Loading;

  const factory LoadDoctorActiveState.success(List<User> list) = _Success;

  const factory LoadDoctorActiveState.failure(String errorMessage) = _Failure;
}
