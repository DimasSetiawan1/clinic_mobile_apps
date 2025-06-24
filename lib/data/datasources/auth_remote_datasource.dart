import 'dart:convert';
import 'dart:developer';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/core/services/firebase_services.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';
import 'package:clinic_mobile_apps/presentation/auth/blocs/bloc_login_google/login_google_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, LoginResponseModel>> loginGoogleBackend(
    String idToken,
  ) async {
    final request = await http.post(
      Uri.parse("${dotenv.env['BASE_URL']}/api/login/google"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({"id_token": idToken}),
    );
    if (request.statusCode == 200 || request.statusCode == 201) {
      return Right(LoginResponseModel.fromMap(jsonDecode(request.body)));
    } else {
      return Left("Failed login to clinic app");
    }
  }

  

  Future<Either<String, String>> updateOneSignalToken(
    String oneSignalToken,
  ) async {
    final userData = AuthLocalDatasource().getUserData();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${userData?.data?.token}',
      'Accept': 'application/json',
    };
    final response = await http.post(
      Uri.parse(
        "${dotenv.env['BASE_URL']}/api/users/${userData?.data?.user?.id}/update-token",
      ),
      headers: headers,
      body: jsonEncode({"one_signal_token": oneSignalToken}),
    );

    if (response.statusCode == 200) {
      final status = jsonDecode(response.body)['status'];
      return Right('$status');
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final firebaseAuth = FirebaseServices();

    if (googleUser == null) {
      throw Exception('Google sign-in aborted by user');
    }

    // Obtain the auth details from the request
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    context.mounted
        ? context.read<LoginGoogleBloc>().add(
          LoginGoogleEvent.loginGoogle(googleAuth?.idToken ?? ''),
        )
        : () {};

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return firebaseAuth.signInWithCredentials(credentials: credential);
  }
}
