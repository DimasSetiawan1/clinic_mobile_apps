import 'dart:convert';
import 'dart:developer';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

class XenditHandleCallbackDatasource {
  Future<void> handleCallback({
    required String orderId,
    required String status,
  }) async {
    final localData = AuthLocalDatasource().getUserData();
    final data = {
      "external_id": orderId,
      "status": status,
    };
    final response = await http.post(
        Uri.parse("${GlobalVariable.baseUrl}/api/orders/"),
        body: jsonEncode(data),

        headers: {
          'Authorization': 'Bearer ${localData?.data?.token}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    log('request status code: ${response.statusCode}');
    if (response.statusCode == 200) {
      log(response.body);
    } else {
      log('failed to handle callback');
    }
  }
}
