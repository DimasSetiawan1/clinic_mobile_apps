import 'dart:convert';

import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/telemedis_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TelemedisDatasource {
  Future<Either<List<TelemedisResponseModel>, String>> getCallRooms() async {
    final userId = AuthLocalDatasource().getUserId();
    if (userId != 0) {
      final response = await http.get(
        Uri.parse('${dotenv.env['BASE_URL']}/api/agora/$userId/call-rooms'),
        headers: {
          'Authorization':
              'Bearer ${AuthLocalDatasource().getUserData()?.data?.token}',
        },
      );
      if (response.statusCode == 200) {
        final data = telemedisResponseModelFromJson(jsonDecode(response.body));
        return Left(data);
      } else {
        return Right('Failed to load call rooms: ${response.reasonPhrase}');
      }
    } else {
      return Right('User ID is not available');
    }
  }
}
