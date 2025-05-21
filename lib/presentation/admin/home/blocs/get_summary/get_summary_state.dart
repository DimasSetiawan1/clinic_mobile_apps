part of 'get_summary_bloc.dart';

@freezed
class GetSummaryState with _$GetSummaryState {
  const factory GetSummaryState.initial() = _Initial;

  factory GetSummaryState.success(SummaryResponseModel summary) = _Success;
  factory GetSummaryState.error(String error) = _Error;
  factory GetSummaryState.loading() = _Loading;
}
