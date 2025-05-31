part of 'get_order_doctor_bloc.dart';

@freezed
class GetOrderDoctorState with _$GetOrderDoctorState {
  const factory GetOrderDoctorState.initial() = _Initial;
  const factory GetOrderDoctorState.loading() = _Loading;
  const factory GetOrderDoctorState.loaded({
    required OrdersResponseModel doctor,
  }) = _Loaded;
  const factory GetOrderDoctorState.error({
    required String message,
  }) = _Error;
}
