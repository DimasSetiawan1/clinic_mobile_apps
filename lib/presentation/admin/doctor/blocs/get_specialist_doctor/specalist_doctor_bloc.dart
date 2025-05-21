import 'package:clinic_mobile_apps/data/models/specialist_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/specalist_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'specalist_doctor_event.dart';
part 'specalist_doctor_state.dart';
part 'specalist_doctor_bloc.freezed.dart';

class SpecalistDoctorBloc
    extends Bloc<SpecalistDoctorEvent, SpecalistDoctorState> {
  final SpecalistDatasource _specalistDatasource;
  SpecalistDoctorBloc(
    this._specalistDatasource,
  ) : super(_Initial()) {
    on<_getSpecialist>((event, emit) async {
      emit(_Loading());
      final request = await _specalistDatasource.getSpecalist();
      request.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
