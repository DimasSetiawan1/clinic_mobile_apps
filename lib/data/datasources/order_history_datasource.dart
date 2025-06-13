import 'dart:convert';
import 'dart:developer';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:clinic_mobile_apps/data/models/response/orders_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class OrderHistoryDatasource {
  Future<Either<String, OrdersResponseModel>> getOrderClinicHistory() async {
    final userData = AuthLocalDatasource().getUserData();
    final request = await http.get(
      Uri.parse(
        "${dotenv.env['BASE_URL']}/api/orders/clinic/${userData?.data?.user?.clinicId}",
      ),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (request.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(request.bodyBytes));
      return Right(OrdersResponseModel.fromMap(jsonResponse));
    } else {
      log(
        "Error fetching order history: ${request.statusCode} - ${request.body}",
      );
      return Left("Error fetching order history");
    }
  }

  // Future<Either<String, OrdersResponseModel>> getOrderDoctorHistory() async {}
  Future<Either<String, OrdersResponseModel>> getOrderPatientHistory() async {
    final userData = AuthLocalDatasource().getUserData();
    final request = await http.get(
      Uri.parse(
        "${dotenv.env['BASE_URL']}/api/orders/patient/${userData?.data?.user?.id}",
      ),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );
    if (request.statusCode == 200) {
      final jsonResponse = json.decode(request.body);
      return Right(OrdersResponseModel.fromMap(jsonResponse));
    } else {
      log(
        "Error fetching order history: ${request.statusCode} - ${request.body}",
      );
      return Left("Error fetching order history");
    }
  }

  Future<Either<String, OrdersResponseModel>> getOrderDoctorHistory() async {
    final userData = AuthLocalDatasource().getUserData();
    final request = await http.get(
      Uri.parse(
        "${dotenv.env['BASE_URL']}/api/orders/doctor/${userData?.data?.user?.id}",
      ),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );
    if (request.statusCode == 200) {
      final jsonResponse = json.decode(request.body);
      return Right(OrdersResponseModel.fromMap(jsonResponse));
    } else {
      log(
        "Error fetching order history: ${request.statusCode} - ${request.body}",
      );
      return Left("Error fetching order history");
    }
  }
}
