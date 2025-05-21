part of 'get_history_bloc.dart';

@freezed
class GetHistoryState with _$GetHistoryState {
  const factory GetHistoryState.initial() = _Initial;
  factory GetHistoryState.loading() = _Loading;
  factory GetHistoryState.loaded(List<HistoryOrders> history) = _Loaded;
  factory GetHistoryState.error(String errorMessage) = _Error;
}
