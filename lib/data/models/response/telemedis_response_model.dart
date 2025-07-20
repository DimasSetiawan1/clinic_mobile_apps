import 'dart:convert';

import 'package:clinic_mobile_apps/data/models/response/doctor_response_model.dart';

List<TelemedisResponseModel> telemedisResponseModelFromJson(String str) =>
    List<TelemedisResponseModel>.from(
      json.decode(str).map((x) => TelemedisResponseModel.fromJson(x)),
    );

String telemedisResponseModelToJson(List<TelemedisResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TelemedisResponseModel {
  int id;
  String callRoomUid;
  String callToken;
  DateTime expiredToken;
  String callChannel;
  String status;
  User patient;
  User doctor;
  DateTime createdAt;
  DateTime updatedAt;

  TelemedisResponseModel({
    required this.id,
    required this.callRoomUid,
    required this.callToken,
    required this.expiredToken,
    required this.callChannel,
    required this.status,
    required this.patient,
    required this.doctor,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TelemedisResponseModel.fromJson(Map<String, dynamic> json) =>
      TelemedisResponseModel(
        id: json["id"],
        callRoomUid: json["call_room_uid"],
        callToken: json["call_token"],
        expiredToken: DateTime.parse(json["expired_token"]),
        callChannel: json["call_channel"],
        patient: User.fromMap(json["patient"]),
        doctor: User.fromMap(json["doctor"]),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "call_room_uid": callRoomUid,
    "call_token": callToken,
    "expired_token": expiredToken.toIso8601String(),
    "call_channel": callChannel,
    "patient": patient.toMap(),
    "doctor": doctor.toMap(),
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
