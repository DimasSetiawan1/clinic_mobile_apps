import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationMessageCubit extends Cubit<bool> {
  ValidationMessageCubit() : super(false);

  void isValidMessage() => emit(true);
  void isNotValidMessage() => emit(false);
}
