// To parse this JSON data, do
//
//     final doctorRequestModel = doctorRequestModelFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

DoctorRequestModel doctorRequestModelFromMap(String str) =>
    DoctorRequestModel.fromMap(json.decode(str));

String doctorRequestModelToMap(DoctorRequestModel data) =>
    json.encode(data.toMap());

class DoctorRequestModel {
  int? id;
  String name;
  String email;
  String password;
  String certification;
  int? clinicId;
  int telemedicineFee;
  String gender;
  String status;

  int chatFee;
  String startTime;
  String endTime;
  int specialistId;
  XFile? image;

  DoctorRequestModel({
     this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.certification,
    this.clinicId,
    required this.telemedicineFee,
    required this.gender,
    required this.status,
    required this.chatFee,
    required this.startTime,
    required this.endTime,
    required this.specialistId,
    this.image,
  });

  DoctorRequestModel copyWith({
    String? name,
    String? email,
    String? password,
    String? certification,
    int? clinicId,
    int? telemedicineFee,
    int? chatFee,
    String? startTime,
    String? endTime,
    int? specialistId,
    String? gender,
    String? status,
  }) =>
      DoctorRequestModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        status: status ?? this.status,
        password: password ?? this.password,
        certification: certification ?? this.certification,
        clinicId: clinicId ?? this.clinicId,
        telemedicineFee: telemedicineFee ?? this.telemedicineFee,
        chatFee: chatFee ?? this.chatFee,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        specialistId: specialistId ?? this.specialistId,
      );

  factory DoctorRequestModel.fromMap(Map<String, dynamic> json) =>
      DoctorRequestModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
        password: json["password"],
        certification: json["certification"],
        clinicId: json["clinic_id"],
        telemedicineFee: json["telemedicine_fee"],
        chatFee: json["chat_fee"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        specialistId: json["specialist_id"],
      );

  Map<String, String> toMap() => {
        "id": id.toString(),
        "name": name,
        "email": email,
        "password": password,
        "gender": gender,
        "status": status,
        "certification": certification,
        "clinic_id": clinicId.toString(),
        "telemedicine_fee": telemedicineFee.toString(),
        "chat_fee": chatFee.toString(),
        "start_time": startTime,
        "end_time": endTime,
        "specialist_id": specialistId.toString(),
      };
}
