import 'package:clinic_mobile_apps/data/datasources/telemedis_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/telemedis_response_model.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/cubits/telemedis_status_cubit.dart';
import 'package:clinic_mobile_apps/presentation/patient/telemedis/widgets/telemedis_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_call_rooms_event.dart';
part 'get_call_rooms_state.dart';
part 'get_call_rooms_bloc.freezed.dart';

class GetCallRoomsBloc extends Bloc<GetCallRoomsEvent, GetCallRoomsState> {
  final TelemedisDatasource _telemedisDatasource;
  GetCallRoomsBloc(this._telemedisDatasource) : super(_Initial()) {
    on<_GetCallRooms>(_getCallRooms);
  }

  _getCallRooms(_GetCallRooms event, Emitter emit) async {
    try {
      emit(_Loading());
      final response = await _telemedisDatasource.getCallRooms(
        event.status.englishLabel,
      );
      response.fold(
        (callRooms) => emit(_Loaded(callRooms)),
        (error) => emit(_Error(error)),
      );
    } catch (e) {
      emit(GetCallRoomsState.error(e.toString()));
    }
  }
}
