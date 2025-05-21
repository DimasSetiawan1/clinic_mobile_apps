import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/order_history_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/orders_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_history_event.dart';
part 'get_history_state.dart';
part 'get_history_bloc.freezed.dart';

class GetHistoryBloc extends Bloc<GetHistoryEvent, GetHistoryState> {
  final OrderHistoryDatasource _orderHistoryDatasource;
  GetHistoryBloc(this._orderHistoryDatasource) : super(_Initial()) {
    on<_getHistory>((event, emit) async {
      final request = await _orderHistoryDatasource.getOrderPatientHistory();
      emit(_Loading());
      request.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data)),
      );
    });
  }
}
