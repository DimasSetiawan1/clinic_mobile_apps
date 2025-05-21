part of 'get_history_bloc.dart';

@freezed
class GetHistoryEvent with _$GetHistoryEvent {
  const factory GetHistoryEvent.started() = _Started;

  const factory GetHistoryEvent.getHistory() = _getHistory;

}