import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/doctor_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/doctor_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'load_doctor_active_event.dart';
part 'load_doctor_active_state.dart';
part 'load_doctor_active_bloc.freezed.dart';

class LoadDoctorActiveBloc
    extends Bloc<LoadDoctorActiveEvent, LoadDoctorActiveState> {
      final DoctorRemoteDatasource _doctorRemoteDatasource;
  LoadDoctorActiveBloc(this._doctorRemoteDatasource) : super(_Initial()) {
    on<_LoadDoctor>((event, emit) async{
      emit(_Loading());
      final result = await _doctorRemoteDatasource.getDoctor();
      result.fold((l) => emit(_Failure(l)), (r) => emit(_Success(r.data)));
    });
  }
}
