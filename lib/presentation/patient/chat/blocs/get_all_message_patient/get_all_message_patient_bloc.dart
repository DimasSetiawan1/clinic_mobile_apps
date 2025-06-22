import 'dart:async';

import 'package:clinic_mobile_apps/data/models/response/room_chat_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_mobile_apps/core/services/firebase_services.dart';
import 'package:clinic_mobile_apps/data/models/request/chat_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_message_patient_event.dart';
part 'get_all_message_patient_state.dart';
part 'get_all_message_patient_bloc.freezed.dart';

class GetAllMessagePatientBloc
    extends Bloc<GetAllMessagePatientEvent, GetAllMessagePatientState> {
  final FirebaseServices _firebaseService;
  GetAllMessagePatientBloc(this._firebaseService) : super(_Initial()) {
    on<_WatchListMessage>(_watchListMessage);
    on<_Received>(_received);
  }

  StreamSubscription<List<RoomChatResponseModel>>? _listChatRoomSubscription;

  Future<void> _watchListMessage(
    _WatchListMessage event,
    Emitter<GetAllMessagePatientState> emit,
  ) async {
    try {
      await _listChatRoomSubscription?.cancel();
      _listChatRoomSubscription = null;
      emit(const GetAllMessagePatientState.initial());
      final stream = _firebaseService.getAllChatRoomsForUser(
        userId: event.patientId,
        role: event.role,
      );

      await emit.forEach(
        stream,
        onData: (List<RoomChatResponseModel> messages) => _Loaded(messages),
        onError: (error, stackTrace) => _Error(error.toString()),
      );
    } catch (e) {
      emit(GetAllMessagePatientState.error(e.toString()));
    }
  }

  Future<void> _received(
    _Received event,
    Emitter<GetAllMessagePatientState> emit,
  ) async {
    try {
      emit(GetAllMessagePatientState.loaded(event.messages));
    } catch (e) {
      emit(GetAllMessagePatientState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _listChatRoomSubscription?.cancel();
    return super.close();
  }
}
