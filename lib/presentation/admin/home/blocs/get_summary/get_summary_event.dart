part of 'get_summary_bloc.dart';

@freezed
class GetSummaryEvent with _$GetSummaryEvent {
  const factory GetSummaryEvent.started() = _Started;

  const factory GetSummaryEvent.summaryFetched() = _SummaryFetched;
}