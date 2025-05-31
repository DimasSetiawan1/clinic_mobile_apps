import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/create_order_datasource.dart';
import 'package:clinic_mobile_apps/data/models/request/create_order_request_model.dart';
import 'package:clinic_mobile_apps/data/models/response/create_order_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';
part 'create_order_bloc.freezed.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final CreateOrderDatasource _createOrderDatasource;
  CreateOrderBloc(this._createOrderDatasource) : super(_Initial()) {
    on<_CreateOrder>((event, emit) async {
      final request = await _createOrderDatasource.createOrder(event.order);
      request.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
