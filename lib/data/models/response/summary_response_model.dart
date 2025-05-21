// To parse this JSON data, do
//
//     final summaryResponseModel = summaryResponseModelFromMap(jsonString);

import 'dart:convert';

SummaryResponseModel summaryResponseModelFromMap(String str) =>
    SummaryResponseModel.fromMap(json.decode(str));

String summaryResponseModelToMap(SummaryResponseModel data) =>
    json.encode(data.toMap());

class SummaryResponseModel {
  String status;
  Data data;

  SummaryResponseModel({
    required this.status,
    required this.data,
  });

  SummaryResponseModel copyWith({
    String? status,
    Data? data,
  }) =>
      SummaryResponseModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory SummaryResponseModel.fromMap(Map<String, dynamic> json) =>
      SummaryResponseModel(
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}

class Data {
  String clinicName;
  String clinicImage;
  int totalIncome;
  int totalDoctor;
  int totalPatient;

  Data({
    required this.clinicName,
    required this.clinicImage,
    required this.totalIncome,
    required this.totalDoctor,
    required this.totalPatient,
  });

  Data copyWith({
    String? clinicName,
    String? clinicImage,
    int? totalIncome,
    int? totalDoctor,
    int? totalPatient,
  }) =>
      Data(
        clinicName: clinicName ?? this.clinicName,
        clinicImage: clinicImage ?? this.clinicImage,
        totalIncome: totalIncome ?? this.totalIncome,
        totalDoctor: totalDoctor ?? this.totalDoctor,
        totalPatient: totalPatient ?? this.totalPatient,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        clinicName: json["clinic_name"],
        clinicImage: json["clinic_image"],
        totalIncome: json["total_income"],
        totalDoctor: json["total_doctor"],
        totalPatient: json["total_patient"],
      );

  Map<String, dynamic> toMap() => {
        "clinic_name": clinicName,
        "clinic_image": clinicImage,
        "total_income": totalIncome,
        "total_doctor": totalDoctor,
        "total_patient": totalPatient,
      };
}
