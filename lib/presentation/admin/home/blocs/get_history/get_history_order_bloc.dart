import 'package:clinic_mobile_apps/data/datasources/order_history_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_mobile_apps/data/models/response/orders_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_history_order_event.dart';
part 'get_history_order_state.dart';
part 'get_history_order_bloc.freezed.dart';

class GetHistoryOrderBloc
    extends Bloc<GetHistoryOrderEvent, GetHistoryOrderState> {
  final OrderHistoryDatasource _orderHistoryDataSource;
  GetHistoryOrderBloc(this._orderHistoryDataSource) : super(_Initial()) {
    on<_getHistoryOrders>((event, emit) async {
      emit(_Loading());
      final request = await _orderHistoryDataSource.getOrderPatientHistory();
      request.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
