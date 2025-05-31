import 'dart:convert';
import 'dart:developer';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/summary_response_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class SummaryClinic {
  Future<Either<String, SummaryResponseModel>> getSummary() async {
    final userData = AuthLocalDatasource().getUserData();
    final response = await http.get(
      Uri.parse(
        '${dotenv.env['BASE_URL']}/api/clinic/${userData?.data?.user?.clinicId}',
      ),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return Right(SummaryResponseModel.fromMap(jsonResponse));
    } else {
      return Left(
        'Failed to fetch summary: ${response.statusCode} - ${response.body}',
      );
    }
  }
}
