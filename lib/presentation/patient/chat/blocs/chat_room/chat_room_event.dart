part of 'chat_room_bloc.dart';

@freezed
class ChatRoomEvent with _$ChatRoomEvent {
  const factory ChatRoomEvent.started() = _Started;
  const factory ChatRoomEvent.watch(String roomId) = _Watch;
  const factory ChatRoomEvent.received(List<ChatRequestModel> messages) = _Received;
  const factory ChatRoomEvent.sendMessage(String roomId,ChatRequestModel messages) = _SendMessage;


}