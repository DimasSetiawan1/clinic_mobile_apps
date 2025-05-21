import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/doctor_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/doctor_response_model.dart';
import 'package:clinic_mobile_apps/data/models/response/orders_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_doctor_event.dart';
part 'get_doctor_state.dart';
part 'get_doctor_bloc.freezed.dart';

class GetDoctorBloc extends Bloc<GetDoctorEvent, GetDoctorState> {
  final DoctorRemoteDatasource _doctorRemoteDatasource;
  GetDoctorBloc(
    this._doctorRemoteDatasource,
  ) : super(_Initial()) {
    on<_getDoctor>((event, emit) async {
      emit(_Loading());
      final request = await _doctorRemoteDatasource.getDoctorsClinic();
      request.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
