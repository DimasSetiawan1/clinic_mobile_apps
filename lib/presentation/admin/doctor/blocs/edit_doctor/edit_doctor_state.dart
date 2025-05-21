part of 'edit_doctor_bloc.dart';

@freezed
class EditDoctorState with _$EditDoctorState {
  const factory EditDoctorState.initial() = _Initial;

  factory EditDoctorState.success(String status) = _Success;
  factory EditDoctorState.error(String error) = _Error;
  factory EditDoctorState.loading() = _Loading;
}
