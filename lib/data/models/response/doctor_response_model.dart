// To parse this JSON data, do
//
//     final doctorResponseModel = doctorResponseModelFromMap(jsonString);

import 'dart:convert';

DoctorResponseModel doctorResponseModelFromMap(String str) =>
    DoctorResponseModel.fromMap(json.decode(str));

String doctorResponseModelToMap(DoctorResponseModel data) =>
    json.encode(data.toMap());

class DoctorResponseModel {
  String status;
  List<User> data;

  DoctorResponseModel({
    required this.status,
    required this.data,
  });

  DoctorResponseModel copyWith({
    String? status,
    List<User>? data,
  }) =>
      DoctorResponseModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory DoctorResponseModel.fromMap(Map<String, dynamic> json) =>
      DoctorResponseModel(
        status: json["status"],
        data: List<User>.from(json["data"].map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class User {
  int id;
  String name;
  String email;
  String status;
  DateTime? emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String role;
  dynamic googleId;
  dynamic ktpNumber;
  dynamic phoneNumber;
  dynamic address;
  dynamic birthDate;
  dynamic gender;
  String? certification;
  int? telemedicineFee;
  int? chatFee;
  String? startTime;
  String? endTime;
  int? clinicId;
  dynamic image;
  int? specialistId;
  Clinic? clinic;
  Specialist? specialist;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.status,
    this.emailVerifiedAt,
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
    required this.clinic,
    required this.specialist,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? status,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? role,
    dynamic googleId,
    dynamic ktpNumber,
    dynamic phoneNumber,
    dynamic address,
    dynamic birthDate,
    dynamic gender,
    String? certification,
    int? telemedicineFee,
    int? chatFee,
    String? startTime,
    String? endTime,
    int? clinicId,
    dynamic image,
    int? specialistId,
    Clinic? clinic,
    Specialist? specialist,
  }) =>
      User(
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
        clinic: clinic ?? this.clinic,
        specialist: specialist ?? this.specialist,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        status: json["status"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        role: json["role"],
        googleId: json["google_id"],
        ktpNumber: json["ktp_number"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        birthDate: json["birth_date"],
        gender: json["gender"],
        certification: json["certification"],
        telemedicineFee: json["telemedicine_fee"],
        chatFee: json["chat_fee"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        clinicId: json["clinic_id"],
        image: json["image"],
        specialistId: json["specialist_id"],
        clinic: json["clinic"] == null ? null : Clinic.fromMap(json["clinic"]),
        specialist: json["specialist"] == null
            ? null
            : Specialist.fromMap(json["specialist"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "status": status,
        "email_verified_at": emailVerifiedAt?.toIso8601String() ??
            DateTime.now().toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
        "clinic": clinic?.toMap(),
        "specialist": specialist?.toMap(),
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

class Specialist {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  Specialist({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  Specialist copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Specialist(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Specialist.fromMap(Map<String, dynamic> json) => Specialist(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
