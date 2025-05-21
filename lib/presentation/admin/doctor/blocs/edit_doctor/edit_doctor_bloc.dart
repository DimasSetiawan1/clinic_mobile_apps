import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/doctor_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/models/request/doctor_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_doctor_event.dart';
part 'edit_doctor_state.dart';
part 'edit_doctor_bloc.freezed.dart';

class EditDoctorBloc extends Bloc<EditDoctorEvent, EditDoctorState> {
  final DoctorRemoteDatasource _doctorRemoteDatasource;
  EditDoctorBloc(this._doctorRemoteDatasource) : super(_Initial()) {
    on<_EditDataDoctor>((event, emit) async {
      final result =
          await _doctorRemoteDatasource.updateDoctorClinic(event.doctor);

      result.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}
