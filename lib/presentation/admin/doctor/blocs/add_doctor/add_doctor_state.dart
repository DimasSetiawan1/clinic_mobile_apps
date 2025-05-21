part of 'add_doctor_bloc.dart';

@freezed
class AddDoctorState with _$AddDoctorState {
  const factory AddDoctorState.initial() = _Initial;

  const factory AddDoctorState.loading() = _Loading;
  const factory AddDoctorState.success(String doctor) = _Success;
  const factory AddDoctorState.failure(String errorMessage) = _Failure;
}
