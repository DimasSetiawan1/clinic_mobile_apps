import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/core/services/firebase_services.dart';
import 'package:clinic_mobile_apps/data/models/request/chat_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_event.dart';
part 'chat_room_state.dart';
part 'chat_room_bloc.freezed.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final FirebaseServices _firebaseServices;
  ChatRoomBloc(this._firebaseServices) : super(_Initial()) {
    on<_Watch>(_onWatch);
    on<_Received>(_onReceived);
    on<_SendMessage>(_sendMessage);
  }

  StreamSubscription<List<ChatRequestModel>>? _chatRoomSubscription;

  Future<void> _onWatch(_Watch event, Emitter<ChatRoomState> emit) async {
    try {
      await _chatRoomSubscription?.cancel();
      _chatRoomSubscription = _firebaseServices
          .getChatRoomById(chatRoomId: event.roomId)
          .listen((event) {
            add(ChatRoomEvent.received(event));
          });
    } catch (e) {
      log("Error in _onWatch: $e");
      emit(ChatRoomState.error(e.toString()));
    }
  }

  Future<void> _onReceived(_Received event, Emitter<ChatRoomState> emit) async {
    try {
      emit(ChatRoomState.loaded(event.messages));
    } catch (e) {
      log("Error in _onReceived: $e");
      emit(ChatRoomState.error(e.toString()));
    }
  }

  Future<void> _sendMessage(_SendMessage event, Emitter<ChatRoomState> emit) async {
    try {
      await _firebaseServices.addMessageToChatRoom(
        chatRoomId: event.roomId,
        messageData: event.messages,
      );
    } catch (e) {
      log("Error in _sendMessage: $e");
      emit(ChatRoomState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _chatRoomSubscription?.cancel();
    return super.close();
  }
}
