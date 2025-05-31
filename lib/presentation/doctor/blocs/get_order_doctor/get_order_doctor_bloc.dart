import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/doctor_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/orders_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_order_doctor_event.dart';
part 'get_order_doctor_state.dart';
part 'get_order_doctor_bloc.freezed.dart';

class GetOrderDoctorBloc
    extends Bloc<GetOrderDoctorEvent, GetOrderDoctorState> {
  final DoctorRemoteDatasource? _doctor;
  GetOrderDoctorBloc(this._doctor) : super(_Initial()) {
    on<_GetOrderDoctor>((event, emit) async {
      emit(_Loading());
      final request = await _doctor?.getDoctorOrders(
        doctorId: event.doctorId,
        service: event.service,
        statusService: event.statusService,
      );
      request!.fold((l) {
        emit(_Error(message: l));
      }, (r) {
        emit(_Loaded(doctor: r));
      });
    });
  }
}
