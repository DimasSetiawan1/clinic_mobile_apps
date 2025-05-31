part of 'create_order_bloc.dart';

@freezed
class CreateOrderState with _$CreateOrderState {
  const factory CreateOrderState.initial() = _Initial;

  factory CreateOrderState.loading() = _Loading;
  factory CreateOrderState.success(CreateOrderResponseModel order) = _Success;
  factory CreateOrderState.failure(String errorMessage) = _Failure;
}
