// To parse this JSON data, do
//
//     final roomChatResponseModel = roomChatResponseModelFromJson(jsonString);

import 'dart:convert';

List<RoomChatResponseModel> roomChatResponseModelFromJson(String str) =>
    List<RoomChatResponseModel>.from(
      json.decode(str).map((x) => RoomChatResponseModel.fromJson(x)),
    );

String roomChatResponseModelToJson(List<RoomChatResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoomChatResponseModel {
  final String id;
  final String doctorName;
  final String doctorImage;
  final String patientName;
  final String patientImage;
  final DateTime createdAt;
  final Participants participants;
  String? lastMessage;
  DateTime? lastMessageTime;

  RoomChatResponseModel({
    required this.id,
    required this.doctorName,
    required this.doctorImage,
    required this.patientName,
    required this.patientImage,
    required this.createdAt,
    required this.participants,
     this.lastMessage,
     this.lastMessageTime,
  });

  RoomChatResponseModel copyWith({
    String? id,
    String? doctorName,
    String? doctorImage,
    String? patientName,
    String? patientImage,
    DateTime? createdAt,
    Participants? participants,
    String? lastMessage,
    DateTime? lastMessageTime,
  }) => RoomChatResponseModel(
    id: id ?? this.id,
    doctorName: doctorName ?? this.doctorName,
    doctorImage: doctorImage ?? this.doctorImage,
    patientName: patientName ?? this.patientName,
    patientImage: patientImage ?? this.patientImage,
    createdAt: createdAt ?? this.createdAt,
    participants: participants ?? this.participants,
    lastMessage: lastMessage ?? this.lastMessage,
    lastMessageTime: lastMessageTime ?? this.lastMessageTime,
  );

  factory RoomChatResponseModel.fromJson(Map<String, dynamic> json) =>
      RoomChatResponseModel(
        id: json["id"] ?? "",
        doctorName: json["doctor_name"],
        doctorImage: json["doctor_image"] ?? "",
        patientName: json["patient_name"],
        patientImage: json["patient_image"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        participants: Participants.fromJson(json["participants"]),
        lastMessage: json["last_message"] ?? "",
        lastMessageTime: DateTime.parse(json["last_message_time"] ?? "") ,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_name": doctorName,
    "doctor_image": doctorImage,
    "patient_name": patientName,
    "patient_image": patientImage,
    "created_at": createdAt.toIso8601String(),
    "participants": participants.toJson(),
    "last_message": lastMessage,
    "last_message_time": lastMessageTime?.toIso8601String(),
  };
}

class Participants {
  final int patientId;
  final int doctorId;

  Participants({required this.patientId, required this.doctorId});

  Participants copyWith({int? patientId, int? doctorId}) => Participants(
    patientId: patientId ?? this.patientId,
    doctorId: doctorId ?? this.doctorId,
  );

  factory Participants.fromJson(Map<String, dynamic> json) =>
      Participants(patientId: json["patient_id"], doctorId: json["doctor_id"]);

  Map<String, dynamic> toJson() => {
    "patient_id": patientId,
    "doctor_id": doctorId,
  };
}
