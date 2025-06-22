part of 'chat_room_bloc.dart';

@freezed
class ChatRoomState with _$ChatRoomState {
  const factory ChatRoomState.initial() = _Initial;
  const factory ChatRoomState.loaded(List<ChatRequestModel> messages) = _Loaded;
  const factory ChatRoomState.failed(String message) = _Failed;
}
