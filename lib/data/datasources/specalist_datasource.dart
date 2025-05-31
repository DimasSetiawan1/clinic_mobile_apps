import 'dart:convert';
import 'dart:developer';

import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/data/models/specialist_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class SpecalistDatasource {
  Future<Either<String, List<SpecialistModel>>> getSpecalist() async {
    try {
      final response = await http.get(
        Uri.parse('${dotenv.env['BASE_URL']}/api/specialists'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          final List<dynamic> data = jsonResponse['data'];
          final specialists =
              data.map((item) => SpecialistModel.fromMap(item)).toList();
          return Right(specialists);
        } else {
          return Left('Invalid response format');
        }
      } else {
        return Left('Failed to fetch specialists: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error in getSpecalist: $e');
      return Left('An error occurred: $e');
    }
  }
}
