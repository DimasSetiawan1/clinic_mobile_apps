import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_order_doctor_event.dart';
part 'get_order_doctor_state.dart';
part '../bloc/get_order_doctor_bloc.freezed.dart';

class GetOrderDoctorBloc extends Bloc<GetOrderDoctorEvent, GetOrderDoctorState> {
  GetOrderDoctorBloc() : super(_Initial()) {
    on<GetOrderDoctorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
