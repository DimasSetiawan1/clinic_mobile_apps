import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/datasources/order_history_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_mobile_apps/data/models/response/orders_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_history_order_event.dart';
part 'get_history_order_state.dart';
part 'get_history_order_bloc.freezed.dart';

class GetHistoryOrderBloc
    extends Bloc<GetHistoryOrderEvent, GetHistoryOrderState> {
  final OrderHistoryDatasource _orderHistoryDataSource;

  final _userData = AuthLocalDatasource().getUserData();

  GetHistoryOrderBloc(this._orderHistoryDataSource) : super(_Initial()) {
    on<_getHistoryOrders>((event, emit) async {
      emit(_Loading());

      final roleUser = _userData?.data?.user?.role;
      late Either<String, OrdersResponseModel> request;
      switch (roleUser) {
        case "doctor":
          request = await _orderHistoryDataSource.getOrderDoctorHistory();
          break;
        case "patient":
          request = await _orderHistoryDataSource.getOrderPatientHistory();
          break;
        default:
          request = await _orderHistoryDataSource.getOrderClinicHistory();
      }
      request.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}
