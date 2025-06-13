part of 'chat_room_bloc.dart';

@freezed
class ChatRoomState with _$ChatRoomState {
  const factory ChatRoomState.initial() = _Initial;
  const factory ChatRoomState.loading() = _Loading;
  const factory ChatRoomState.loaded(List<ChatRequestModel> messages) = _Loaded;
  const factory ChatRoomState.error(String message) = _Error;
}
