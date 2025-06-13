import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/get_list_message_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/list_message_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_message_patient_event.dart';
part 'get_all_message_patient_state.dart';
part 'generated/get_all_message_patient_bloc.freezed.dart';

class GetAllMessagePatientBloc
    extends Bloc<GetAllMessagePatientEvent, GetAllMessagePatientState> {
  final GetAllMessageDatasource _getAllMessageDatasource;
  GetAllMessagePatientBloc(this._getAllMessageDatasource) : super(_Initial()) {
    on<_GetAllMessage>((event, emit) async {
      emit(_Loading());
      try {
        final messages = await _getAllMessageDatasource.fetchAllMessages();
        messages.fold(
          (error) => emit(_Error(error)),
          (messageList) => emit(_Loaded(messageList)),
        );
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
