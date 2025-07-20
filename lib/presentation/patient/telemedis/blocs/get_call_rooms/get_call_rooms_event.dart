part of 'get_call_rooms_bloc.dart';

@freezed
class GetCallRoomsEvent with _$GetCallRoomsEvent {
  const factory GetCallRoomsEvent.started() = _Started;
  const factory GetCallRoomsEvent.getCallRooms(TelemedisStatusState status) = _GetCallRooms;
}