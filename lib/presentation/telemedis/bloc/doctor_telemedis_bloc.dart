import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/doctor_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/doctor_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_telemedis_event.dart';
part 'doctor_telemedis_state.dart';
part 'doctor_telemedis_bloc.freezed.dart';

class DoctorTelemedisBloc
    extends Bloc<DoctorTelemedisEvent, DoctorTelemedisState> {
  final DoctorRemoteDatasource doctorRemoteDatasource;
  DoctorTelemedisBloc(
    this.doctorRemoteDatasource,
  ) : super(_Initial()) {
    on<_GetDoctorTelemedis>((event, emit) async {
      emit(_Loading());
      final getDoctor = await doctorRemoteDatasource.getDoctor();
      getDoctor.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data)),
      );
    });
  }
}
