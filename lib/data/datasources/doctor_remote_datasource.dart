import 'dart:convert';
import 'dart:developer';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/request/doctor_request_model.dart';
import 'package:clinic_mobile_apps/data/models/response/doctor_response_model.dart';
import 'package:clinic_mobile_apps/data/models/response/orders_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class DoctorRemoteDatasource {
  Future<Either<String, DoctorResponseModel>> getDoctor() async {
    final response = await http.get(
        Uri.parse('${GlobalVariable.baseUrl}/api/clinic/doctor/active'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      return Right(DoctorResponseModel.fromMap(json.decode(response.body)));
    } else {
      return Left('Failed to load doctor');
    }
  }

  Future<Either<String, DoctorResponseModel>> getDoctorChats() async {
    final response = await http.get(
        Uri.parse('${GlobalVariable.baseUrl}/api/clinic/doctor/active'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      return Right(DoctorResponseModel.fromMap(json.decode(response.body)));
    } else {
      return Left('Failed to load doctor');
    }
  }

  Future<Either<String, DoctorResponseModel>> getDoctorsClinic() async {
    final localData = AuthLocalDatasource().getUserData();
    final response = await http.get(
        Uri.parse(
            '${GlobalVariable.baseUrl}/api/clinic/doctors/${localData?.data?.user?.clinicId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${localData?.data?.token}',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      return Right(DoctorResponseModel.fromMap(json.decode(response.body)));
    } else {
      return Left('Failed to load doctor');
    }
  }

  Future<Either<String, String>> storeDoctorClinic(
      DoctorRequestModel request) async {
    final localData = AuthLocalDatasource().getUserData();
    final headers = {
      'Authorization': 'Bearer ${localData?.data?.token}',
      'Accept': 'application/json',
    };
    final response = http.MultipartRequest(
      'POST',
      Uri.parse('${GlobalVariable.baseUrl}/api/clinic/doctor'),
    );
    request.clinicId = localData?.data?.user?.clinicId;
    response.fields.addAll(request.toMap());
    if (request.image != null) {
      response.files
          .add(await http.MultipartFile.fromPath('image', request.image!.path));
    }
    response.headers.addAll(headers);

    http.StreamedResponse req = await response.send();

    final String body = await req.stream.bytesToString();

    if (req.statusCode == 201) {
      final message = jsonDecode(body)['status'];
      return Right(message);
    } else {
      final message = jsonDecode(body)['message'];
      return Left(message);
    }
  }

  Future<Either<String, String>> updateDoctorClinic(
      DoctorRequestModel request) async {
    final localData = AuthLocalDatasource().getUserData();
    final headers = {
      'Authorization': 'Bearer ${localData?.data?.token}',
      'Accept': 'application/json',
    };
    final response = http.MultipartRequest(
      'POST',
      Uri.parse('${GlobalVariable.baseUrl}/api/clinic/doctor/${request.id}'),
    );
    response.fields.addAll(request.toMap());
    if (request.image != null) {
      response.files
          .add(await http.MultipartFile.fromPath('image', request.image!.path));
    }
    response.headers.addAll(headers);

    http.StreamedResponse req = await response.send();

    final String body = await req.stream.bytesToString();

    if (req.statusCode == 200) {
      final message = jsonDecode(body)['message'];
      return Right(message);
    } else {
      final message = jsonDecode(body)['message'];
      return Left(message);
    }
  }

  Future<Either<String, OrdersResponseModel>> getDoctorOrders(
      int doctorId) async {
    final localData = AuthLocalDatasource().getUserData();
    final headers = {
      'Authorization': 'Bearer ${localData?.data?.token}',
      'Accept': 'application/json',
    };
    final response = await http.get(
        Uri.parse(
          '${GlobalVariable.baseUrl}/api/order/$doctorId',
        ),
        headers: headers);

    if (response.statusCode == 200) {
      final message = OrdersResponseModel.fromMap(json.decode(response.body));
      return Right(message);
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }
}
