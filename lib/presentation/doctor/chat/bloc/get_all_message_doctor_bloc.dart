import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/core/services/firebase_services.dart';
import 'package:clinic_mobile_apps/data/models/request/chat_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_message_doctor_event.dart';
part 'get_all_message_doctor_state.dart';
part 'get_all_message_doctor_bloc.freezed.dart';

class GetAllMessageDoctorBloc
    extends Bloc<GetAllMessageDoctorEvent, GetAllMessageDoctorState> {
  final FirebaseServices _firebaseService;
  GetAllMessageDoctorBloc(this._firebaseService) : super(_Initial()) {
    on<_GetAllMessage>((event, emit) async {
      emit(_Loading());
      // try {
      //   // Simulate fetching messages from a data source
      //   final messages = await _firebaseService.fetchAllMessages();
      //   messages.fold(
      //     (error) => emit(_Error(error)),
      //     (messageList) => emit(_Loaded(messageList)),
      //   );
      // } catch (e) {
      //   emit(_Error(e.toString()));
      // }
    });
  }
}
