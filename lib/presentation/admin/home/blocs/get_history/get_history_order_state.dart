part of 'get_history_order_bloc.dart';

@freezed
class GetHistoryOrderState with _$GetHistoryOrderState {
  const factory GetHistoryOrderState.initial() = _Initial;

  const factory GetHistoryOrderState.loading() = _Loading;
  const factory GetHistoryOrderState.success(OrdersResponseModel orders) = _Success;
  const factory GetHistoryOrderState.error(String errorMessage) = _Error;

}
