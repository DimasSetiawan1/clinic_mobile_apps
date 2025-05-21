part of 'get_doctor_bloc.dart';

@freezed
class GetDoctorState with _$GetDoctorState {
  const factory GetDoctorState.initial() = _Initial;
  factory GetDoctorState.loading() = _Loading;
  factory GetDoctorState.success(DoctorResponseModel doctor) = _Success;
  factory GetDoctorState.error(String error) = _Error;
}
