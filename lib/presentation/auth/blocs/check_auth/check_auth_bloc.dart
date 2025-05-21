import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_auth_event.dart';
part 'check_auth_state.dart';
part 'check_auth_bloc.freezed.dart';

class CheckAuthBloc extends Bloc<CheckAuthEvent, CheckAuthState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  CheckAuthBloc(this._authRemoteDatasource) : super(_Initial()) {
    on<_CheckAuth>((event, emit) async {
      final result = await _authRemoteDatasource.checkAuth(event.idToken);
      result.fold((l) => emit(CheckAuthState.unauthenticated()),
          (r) => emit(CheckAuthState.authenticated()));
    });
    
  }
}
