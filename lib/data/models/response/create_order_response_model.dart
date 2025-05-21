// To parse this JSON data, do
//
//     final createOrderResponseModel = createOrderResponseModelFromMap(jsonString);

import 'dart:convert';

CreateOrderResponseModel createOrderResponseModelFromMap(String str) =>
    CreateOrderResponseModel.fromMap(json.decode(str));

String createOrderResponseModelToMap(CreateOrderResponseModel data) =>
    json.encode(data.toMap());

class CreateOrderResponseModel {
  String? status;
  Data? data;

  CreateOrderResponseModel({
    this.status,
    this.data,
  });

  CreateOrderResponseModel copyWith({
    String? status,
    Data? data,
  }) =>
      CreateOrderResponseModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory CreateOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      CreateOrderResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data?.toMap(),
      };
}

class Data {
  int? patientId;
  int? doctorId;
  String? service;
  int? price;
  int? duration;
  int? clinicId;
  DateTime? schedule;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? paymentUrl;

  Data({
    this.patientId,
    this.doctorId,
    this.service,
    this.price,
    this.duration,
    this.clinicId,
    this.schedule,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.paymentUrl,
  });

  Data copyWith({
    int? patientId,
    int? doctorId,
    String? service,
    int? price,
    int? duration,
    int? clinicId,
    DateTime? schedule,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
    String? paymentUrl,
  }) =>
      Data(
        patientId: patientId ?? this.patientId,
        doctorId: doctorId ?? this.doctorId,
        service: service ?? this.service,
        price: price ?? this.price,
        duration: duration ?? this.duration,
        clinicId: clinicId ?? this.clinicId,
        schedule: schedule ?? this.schedule,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        paymentUrl: paymentUrl ?? this.paymentUrl,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        service: json["service"],
        price: json["price"],
        duration: json["duration"],
        clinicId: json["clinic_id"],
        schedule:
            json["schedule"] == null ? null : DateTime.parse(json["schedule"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
        paymentUrl: json["payment_url"],
      );

  Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "doctor_id": doctorId,
        "service": service,
        "price": price,
        "duration": duration,
        "clinic_id": clinicId,
        "schedule":
            "${schedule!.year.toString().padLeft(4, '0')}-${schedule!.month.toString().padLeft(2, '0')}-${schedule!.day.toString().padLeft(2, '0')}",
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "payment_url": paymentUrl,
      };
}
