import 'package:flutter_bloc/flutter_bloc.dart';

class TelemedisStatusCubit extends Cubit<TelemedisStatusState> {
  TelemedisStatusCubit() : super(TelemedisStatusState.semua);

  void setFilterStatus(TelemedisStatusState status) {
    emit(status);
  }
  bool isSemua() => state == TelemedisStatusState.semua;
  bool isBerlangsung() => state == TelemedisStatusState.berlangsung;
  bool isSelesai() => state == TelemedisStatusState.kadaluarsa;
  bool isMenunggu() => state == TelemedisStatusState.menunggu;


  
}

enum TelemedisStatusState { semua, berlangsung, kadaluarsa, menunggu }

extension TelemedisStatusStateExtension on TelemedisStatusState {
  String get englishLabel {
    switch (this) {
      case TelemedisStatusState.semua:
        return 'All';
      case TelemedisStatusState.berlangsung:
        return 'Ongoing';
      case TelemedisStatusState.kadaluarsa:
        return 'Expired';
      case TelemedisStatusState.menunggu:
        return 'Waiting';
    }
  }
}
