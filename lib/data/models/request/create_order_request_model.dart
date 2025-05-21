// To parse this JSON data, do
//
//     final createOrderRequestModel = createOrderRequestModelFromMap(jsonString);

import 'dart:convert';

CreateOrderRequestModel createOrderRequestModelFromMap(String str) => CreateOrderRequestModel.fromMap(json.decode(str));

String createOrderRequestModelToMap(CreateOrderRequestModel data) => json.encode(data.toMap());

class CreateOrderRequestModel {
    int? patientId;
    int? doctorId;
    String? service;
    int? price;
    int? duration;
    int? clinicId;
    DateTime? schedule;

    CreateOrderRequestModel({
        this.patientId,
        this.doctorId,
        this.service,
        this.price,
        this.duration,
        this.clinicId,
        this.schedule,
    });

    CreateOrderRequestModel copyWith({
        int? patientId,
        int? doctorId,
        String? service,
        int? price,
        int? duration,
        int? clinicId,
        DateTime? schedule,
    }) => 
        CreateOrderRequestModel(
            patientId: patientId ?? this.patientId,
            doctorId: doctorId ?? this.doctorId,
            service: service ?? this.service,
            price: price ?? this.price,
            duration: duration ?? this.duration,
            clinicId: clinicId ?? this.clinicId,
            schedule: schedule ?? this.schedule,
        );

    factory CreateOrderRequestModel.fromMap(Map<String, dynamic> json) => CreateOrderRequestModel(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        service: json["service"],
        price: json["price"],
        duration: json["duration"],
        clinicId: json["clinic_id"],
        schedule: json["schedule"] == null ? null : DateTime.parse(json["schedule"]),
    );

    Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "doctor_id": doctorId,
        "service": service,
        "price": price,
        "duration": duration,
        "clinic_id": clinicId,
        "schedule": "${schedule!.year.toString().padLeft(4, '0')}-${schedule!.month.toString().padLeft(2, '0')}-${schedule!.day.toString().padLeft(2, '0')}",
    };
}
