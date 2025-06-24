import 'dart:convert';

import 'package:clinic_mobile_apps/core/enums/user_role.dart';
import 'package:clinic_mobile_apps/core/utils/shared_preferences_utils.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';

class AuthLocalDatasource {
  Future<void> savedUserData(LoginResponseModel data) async {
    await SharedPreferencesUtils.instance.setString('user', data.toJson());
  }

  LoginResponseModel? getUserData() {
    final userData = SharedPreferencesUtils.instance.getString('user');
    if (userData != null) {
      return LoginResponseModel.fromJson(userData);
    }
    return null;
  }

  int getUserId() {
    final userData = getUserData();
    if (userData != null) {
      return userData.data?.user?.id ?? 0;
    }
    return 0;
  }

  bool isNewUser() {
    final userData = getUserData();
    if (userData != null) {
      return userData.data?.isNew ?? false;
    }
    return true;
  }

  Future<void> removeUserData() async {
    await SharedPreferencesUtils.instance.remove('user');
  }

  bool isLoggedIn() {
    final userData = SharedPreferencesUtils.instance.getString('user');
    return userData != null;
  }

  UserRole getRoleUser() {
    final userData = getUserData();
    if (userData != null) {
      return UserRole.fromString(userData.data?.user?.role ?? "");
    }
    return UserRole.patient;
  }
}
