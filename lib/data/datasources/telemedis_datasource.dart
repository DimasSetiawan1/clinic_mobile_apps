import 'dart:convert';
import 'dart:developer';

import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/telemedis_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TelemedisDatasource {
  Future<Either<List<TelemedisResponseModel>, String>> getCallRooms(
    String? status,
  ) async {
    final userId = AuthLocalDatasource().getUserId();
    final url =
        status!.isEmpty
            ? '${dotenv.env['BASE_URL']}/api/agora/$userId/call-rooms'
            : '${dotenv.env['BASE_URL']}/api/agora/$userId/call-rooms?status=$status';
    if (userId != 0) {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization':
              'Bearer ${AuthLocalDatasource().getUserData()?.data?.token}',
        },
      );
      if (response.statusCode == 200) {
        final data = telemedisResponseModelFromJson(response.body);
        return Left(data);
      } else {
        return Right('Tidak Ada Data Tersedia');
      }
    } else {
      return Right('User ID is not available');
    }
  }
}
