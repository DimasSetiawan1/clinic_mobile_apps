import 'dart:developer';

import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CheckAuthCubit extends Cubit<AuthState> {
  CheckAuthCubit() : super(AuthState.initial) {
    checkAuth();
  }

  void checkAuth() async {
    final bool isSignedIn =
        FirebaseAuth.instance.currentUser != null ||
        await GoogleSignIn().isSignedIn();
    if (isSignedIn || AuthLocalDatasource().isLoggedIn()) {
      emit(AuthState.authenticated);
    } else {
      emit(AuthState.unauthenticated);
    }
  }
}

enum AuthState { initial,authenticated, unauthenticated }