// To parse this JSON data, do
//
//     final ordersResponseModel = ordersResponseModelFromMap(jsonString);

import 'dart:convert';

OrdersResponseModel ordersResponseModelFromMap(String str) =>
    OrdersResponseModel.fromMap(json.decode(str));

String ordersResponseModelToMap(OrdersResponseModel data) =>
    json.encode(data.toMap());

class OrdersResponseModel {
  String status;
  List<HistoryOrders> data;

  OrdersResponseModel({
    required this.status,
    required this.data,
  });

  OrdersResponseModel copyWith({
    String? status,
    List<HistoryOrders>? data,
  }) =>
      OrdersResponseModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory OrdersResponseModel.fromMap(Map<String, dynamic> json) =>
      OrdersResponseModel(
        status: json["status"],
        data: List<HistoryOrders>.from(
            json["data"].map((x) => HistoryOrders.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class HistoryOrders {
  int id;
  int patientId;
  int doctorId;
  String service;
  BigInt price;
  String paymentUrl;
  String status;
  int duration;
  int clinicId;
  String schedule;
  String createdAt;
  String updatedAt;
  String? statusService;
  String? birthDate;
  Doctor patient;
  Doctor doctor;
  Clinic clinic;
  ChatRooms chatRooms;

  HistoryOrders({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.service,
    required this.price,
    required this.paymentUrl,
    required this.status,
    required this.duration,
    required this.clinicId,
    required this.schedule,
    required this.createdAt,
    required this.updatedAt,
    required this.statusService,
    required this.birthDate,
    required this.patient,
    required this.doctor,
    required this.clinic,
    required this.chatRooms,
  });

  HistoryOrders copyWith({
    int? id,
    int? patientId,
    int? doctorId,
    String? service,
    BigInt? price,
    String? paymentUrl,
    String? status,
    int? duration,
    int? clinicId,
    String? schedule,
    String? createdAt,
    String? updatedAt,
    String? statusService,
    String? birthDate,
    Doctor? patient,
    Doctor? doctor,
    Clinic? clinic,
    ChatRooms? chatRooms,
  }) =>
      HistoryOrders(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        doctorId: doctorId ?? this.doctorId,
        service: service ?? this.service,
        price: price ?? this.price,
        paymentUrl: paymentUrl ?? this.paymentUrl,
        status: status ?? this.status,
        duration: duration ?? this.duration,
        clinicId: clinicId ?? this.clinicId,
        schedule: schedule ?? this.schedule,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        statusService: statusService ?? this.statusService,
        birthDate: birthDate ?? this.birthDate,
        patient: patient ?? this.patient,
        doctor: doctor ?? this.doctor,
        clinic: clinic ?? this.clinic,
        chatRooms: chatRooms ?? this.chatRooms,
      );

  factory HistoryOrders.fromMap(Map<String, dynamic> json) => HistoryOrders(
      id: json["id"] ?? 0,
      patientId: json["patient_id"] ?? 0,
      doctorId: json["doctor_id"] ?? 0,
      service: json["service"],
      price: BigInt.from(json["price"] ?? 0),
      paymentUrl: json["payment_url"] ?? "",
      status: json["status"],
      duration: json["duration"] ?? 0,
      clinicId: json["clinic_id"] ?? 0,
      schedule: json["schedule"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      statusService: json["status_service"] ?? "",
      birthDate: json["birth_date"] ?? "",
      patient: Doctor.fromMap(json["patient"]),
      doctor: Doctor.fromMap(json["doctor"]),
      clinic: Clinic.fromMap(json["clinic"]),
      chatRooms: ChatRooms.fromMap(json["chat_rooms"]));

  Map<String, dynamic> toMap() => {
        "id": id,
        "patient_id": patientId,
        "doctor_id": doctorId,
        "service": service,
        "price": price,
        "payment_url": paymentUrl,
        "status": status,
        "duration": duration,
        "clinic_id": clinicId,
        "schedule": schedule,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "status_service": statusService,
        "birth_date": birthDate,
        "patient": patient.toMap(),
        "doctor": doctor.toMap(),
        "clinic": clinic.toMap(),
        "chat_rooms": chatRooms.toMap(),
      };
}

class Clinic {
  int id;
  String name;
  String address;
  String phoneNumber;
  String email;
  String openTime;
  String closeTime;
  String website;
  String description;
  String image;
  String spesialis;
  DateTime createdAt;
  DateTime updatedAt;

  Clinic({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.openTime,
    required this.closeTime,
    required this.website,
    required this.description,
    required this.image,
    required this.spesialis,
    required this.createdAt,
    required this.updatedAt,
  });

  Clinic copyWith({
    int? id,
    String? name,
    String? address,
    String? phoneNumber,
    String? email,
    String? openTime,
    String? closeTime,
    String? website,
    String? description,
    String? image,
    String? spesialis,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Clinic(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        openTime: openTime ?? this.openTime,
        closeTime: closeTime ?? this.closeTime,
        website: website ?? this.website,
        description: description ?? this.description,
        image: image ?? this.image,
        spesialis: spesialis ?? this.spesialis,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Clinic.fromMap(Map<String, dynamic> json) => Clinic(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        website: json["website"],
        description: json["description"],
        image: json["image"],
        spesialis: json["spesialis"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "phone_number": phoneNumber,
        "email": email,
        "open_time": openTime,
        "close_time": closeTime,
        "website": website,
        "description": description,
        "image": image,
        "spesialis": spesialis,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Doctor {
  int id;
  String name;
  String email;
  String status;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;
  String role;
  BigInt googleId;
  String ktpNumber;
  String phoneNumber;
  String address;
  String birthDate;
  String gender;
  String certification;
  int telemedicineFee;
  int chatFee;
  String startTime;
  String endTime;
  int clinicId;
  String image;
  int specialistId;
  String oneSignalToken;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.status,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.googleId,
    required this.ktpNumber,
    required this.phoneNumber,
    required this.address,
    required this.birthDate,
    required this.gender,
    required this.certification,
    required this.telemedicineFee,
    required this.chatFee,
    required this.startTime,
    required this.endTime,
    required this.clinicId,
    required this.image,
    required this.specialistId,
    required this.oneSignalToken,
  });

  Doctor copyWith({
    int? id,
    String? name,
    String? email,
    String? status,
    String? emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
    String? role,
    BigInt? googleId,
    String? ktpNumber,
    String? phoneNumber,
    String? address,
    String? birthDate,
    String? gender,
    String? certification,
    int? telemedicineFee,
    int? chatFee,
    String? startTime,
    String? endTime,
    int? clinicId,
    String? image,
    int? specialistId,
    dynamic oneSignalToken,
  }) =>
      Doctor(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        status: status ?? this.status,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        role: role ?? this.role,
        googleId: googleId ?? this.googleId,
        ktpNumber: ktpNumber ?? this.ktpNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        certification: certification ?? this.certification,
        telemedicineFee: telemedicineFee ?? this.telemedicineFee,
        chatFee: chatFee ?? this.chatFee,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        clinicId: clinicId ?? this.clinicId,
        image: image ?? this.image,
        specialistId: specialistId ?? this.specialistId,
        oneSignalToken: oneSignalToken ?? this.oneSignalToken,
      );

  factory Doctor.fromMap(Map<String, dynamic> json) => Doctor(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        status: json["status"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        role: json["role"] ?? "",
        googleId: BigInt.parse(json["google_id"] ?? "0"),
        ktpNumber: json["ktp_number"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
        address: json["address"] ?? "",
        birthDate: json["birth_date"] ?? "",
        gender: json["gender"] ?? "",
        certification: json["certification"] ?? "",
        telemedicineFee: json["telemedicine_fee"] ?? 0,
        chatFee: json["chat_fee"] ?? 0,
        startTime: json["start_time"] ?? "",
        endTime: json["end_time"] ?? "",
        clinicId: json["clinic_id"] ?? 0,
        image: json["image"] ?? "",
        specialistId: json["specialist_id"] ?? 0,
        oneSignalToken: json["one_signal_token"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "role": role,
        "google_id": googleId,
        "ktp_number": ktpNumber,
        "phone_number": phoneNumber,
        "address": address,
        "birth_date": birthDate,
        "gender": gender,
        "certification": certification,
        "telemedicine_fee": telemedicineFee,
        "chat_fee": chatFee,
        "start_time": startTime,
        "end_time": endTime,
        "clinic_id": clinicId,
        "image": image,
        "specialist_id": specialistId,
        "one_signal_token": oneSignalToken,
      };
}

class ChatRooms {
  String id;
  int ordersId;
  int usersId;
  int doctorsId;
  String status;
  String? closedAt;
  String? closedBy;
  DateTime createdAt;
  DateTime updatedAt;

  ChatRooms({
    required this.id,
    required this.ordersId,
    required this.usersId,
    required this.doctorsId,
    required this.status,
    this.closedAt,
    this.closedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  ChatRooms copyWith({
    String? id,
    int? ordersId,
    int? usersId,
    int? doctorsId,
    String? status,
    String? closedAt,
    String? closedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ChatRooms(
        id: id ?? this.id,
        ordersId: ordersId ?? this.ordersId,
        usersId: usersId ?? this.usersId,
        doctorsId: doctorsId ?? this.doctorsId,
        status: status ?? this.status,
        closedAt: closedAt ?? this.closedAt,
        closedBy: closedBy ?? this.closedBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ChatRooms.fromMap(Map<String, dynamic> json) => ChatRooms(
        id: json["id"] ?? "",
        ordersId: json["orders_id"] ?? 0,
        usersId: json["users_id"] ?? 0,
        doctorsId: json["doctors_id"] ?? 0,
        status: json["status"] ?? "",
        closedAt: json["closed_at"],
        closedBy: json["closed_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "orders_id": ordersId,
        "users_id": usersId,
        "doctors_id": doctorsId,
        "status": status,
        "closed_at": closedAt,
        "closed_by": closedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
