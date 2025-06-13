part of 'load_doctor_active_bloc.dart';

@freezed
class LoadDoctorActiveEvent with _$LoadDoctorActiveEvent {
  const factory LoadDoctorActiveEvent.started() = _Started;

  const factory LoadDoctorActiveEvent.loadDoctor() = _LoadDoctor;
  
}