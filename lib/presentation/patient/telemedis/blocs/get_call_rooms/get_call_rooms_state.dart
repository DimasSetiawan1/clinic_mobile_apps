part of 'get_call_rooms_bloc.dart';

@freezed
class GetCallRoomsState with _$GetCallRoomsState {
  const factory GetCallRoomsState.initial() = _Initial;
  const factory GetCallRoomsState.loading() = _Loading;
  const factory GetCallRoomsState.loaded(
    List<TelemedisResponseModel> callRooms,
  ) = _Loaded;
  const factory GetCallRoomsState.error(String message) = _Error;
}
