import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationMessageCubit extends Cubit<ValidationMessageState> {
  ValidationMessageCubit() : super(ValidationMessageState.initial);
  
  void setValid() {
    emit(ValidationMessageState.valid);
  }
  void setNotValid() {
    emit(ValidationMessageState.notValid);
  }
}

enum ValidationMessageState {
  initial,
  valid,
  notValid,
}