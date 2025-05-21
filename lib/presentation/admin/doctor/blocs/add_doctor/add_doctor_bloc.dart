import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/doctor_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/models/request/doctor_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_doctor_event.dart';
part 'add_doctor_state.dart';
part 'add_doctor_bloc.freezed.dart';

class AddDoctorBloc extends Bloc<AddDoctorEvent, AddDoctorState> {
  final DoctorRemoteDatasource _doctorRemoteDatasource;
  AddDoctorBloc(
    this._doctorRemoteDatasource,
  ) : super(_Initial()) {
    on<_addDoctor>((event, emit) async {
      emit(_Loading());
      final request =
          await _doctorRemoteDatasource.storeDoctorClinic(event.doctor);
      request.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
