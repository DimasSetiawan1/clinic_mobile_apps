import 'dart:convert';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/request/create_order_request_model.dart';
import 'package:clinic_mobile_apps/data/models/response/create_order_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class CreateOrderDatasource {
  Future<Either<String, CreateOrderResponseModel>> createOrder(
      CreateOrderRequestModel requestModel) async {
    final localData = AuthLocalDatasource().getUserData();
    final request = await http.post(
      Uri.parse('${GlobalVariable.baseUrl}/api/orders'),
      headers: {
        'Authorization': 'Bearer ${localData?.data?.token}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(requestModel.toMap()),
    );
    if (request.statusCode == 201) {
      final response =
          CreateOrderResponseModel.fromMap(json.decode(request.body));
      return Right(response);
    } else {
      return Left("${request.statusCode}");
    }
  }
}
