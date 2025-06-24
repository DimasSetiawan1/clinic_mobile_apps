import 'package:flutter_bloc/flutter_bloc.dart';

class StackNavigationCubit extends Cubit<int>{
  StackNavigationCubit() : super(0);

  void setIndex(int index) {
    emit(index);
  }

  int get currentIndex => state;

}