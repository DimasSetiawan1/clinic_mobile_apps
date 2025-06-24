import 'package:clinic_mobile_apps/data/datasources/telemedis_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/telemedis_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_call_rooms_event.dart';
part 'get_call_rooms_state.dart';
part 'get_call_rooms_bloc.freezed.dart';

class GetCallRoomsBloc extends Bloc<GetCallRoomsEvent, GetCallRoomsState> {
  final TelemedisDatasource _telemedisDatasource;
  GetCallRoomsBloc(this._telemedisDatasource) : super(_Initial()) {
    on<GetCallRoomsEvent>(_getCallRooms);
  }

  _getCallRooms(GetCallRoomsEvent event, Emitter emit) async {
    try {
      emit(_Loading());
      final response = await _telemedisDatasource.getCallRooms();
      response.fold(
        (callRooms) => emit(_Loaded(callRooms)),
        (error) => emit(_Error(error)),
      );
    } catch (e) {
      emit(GetCallRoomsState.error(e.toString()));
    }
  }
}
