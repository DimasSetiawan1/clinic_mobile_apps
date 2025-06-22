import 'dart:convert';
import 'dart:developer';

import 'package:clinic_mobile_apps/data/datasources/auth_local_datasource.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:http/http.dart' as http;

class OnesignalNotificationDatasource {
  Future<void> sendMessageNotification(
    String message,
    int senderId,
    int receiverId,
    String senderName,
  ) async {
    try {
      final localData = AuthLocalDatasource().getUserData();
      final Map<String, dynamic> requestBody = {
        'message': message,
        'recipient_id': receiverId,
        'sender_id': senderId,
        'sender_name': senderName,
      };
      final response = await http.post(
        Uri.parse('${dotenv.env['BASE_URL']}/api/notification/send'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${localData?.data?.token}',
        },
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        log('Notification sent successfully');
      } else {
        log(
          'Failed to send notification: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      log('Error sending notification: $e');
    }
  }
}
