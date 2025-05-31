part of 'get_order_doctor_bloc.dart';

@freezed
class GetOrderDoctorEvent with _$GetOrderDoctorEvent {
  const factory GetOrderDoctorEvent.started() = _Started;
  const factory GetOrderDoctorEvent.getOrderDoctor(
    int? doctorId,
    String? service,
    String? statusService,
  ) = _GetOrderDoctor;
}
