import 'dart:developer';

import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/list_message_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GetAllMessageDatasource {
  Future<Either<String, List<ChatRoom>>> fetchAllMessages() async {
    try {
      final userData = AuthLocalDatasource().getUserData();
      final messages = await http.get(
        Uri.parse(
          "${dotenv.env['BASE_URL']}/api/${userData?.data?.user?.id}/chat-rooms",
        ),
        headers: {
          'Authorization': 'Bearer ${userData?.data?.token}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (messages.statusCode == 200) {
        try {
          final roleUser = userData?.data?.user?.role;
          if (roleUser == "doctor") {
            final jsonResponse = listMessageForDoctorFromJson(messages.body);
            return Right(jsonResponse.chatRooms);
          } else {
            final jsonResponse = listMessageForPatientFromJson(messages.body);
            return Right(jsonResponse.chatRooms);
          }
        } catch (e, stack) {
          log("Parsing error: $e\n$stack");
          return Left("Failed to parse messages");
        }
      } else {
        return Left("Failed to fetch messages");
      }
    } catch (e) {
      return Left("Failed to fetch messages");
    }
  }
}
