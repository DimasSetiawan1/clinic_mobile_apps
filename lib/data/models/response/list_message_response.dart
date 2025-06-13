// To parse this JSON data, do
//
//     final listMessage = listMessageFromJson(jsonString);

import 'dart:convert';

ListMessage listMessageForPatientFromJson(String str) =>
    ListMessage.fromJson(json.decode(str), "doctor");
ListMessage listMessageForDoctorFromJson(String str) =>
    ListMessage.fromJson(json.decode(str), "patient");

String listMessageToJson(ListMessage data) => json.encode(data.toJson());

class ListMessage {
  final String status;
  final String message;
  final List<ChatRoom> chatRooms;

  ListMessage({
    required this.status,
    required this.message,
    required this.chatRooms,
  });

  ListMessage copyWith({
    String? status,
    String? message,
    List<ChatRoom>? chatRooms,
  }) => ListMessage(
    status: status ?? this.status,
    message: message ?? this.message,
    chatRooms: chatRooms ?? this.chatRooms,
  );

  factory ListMessage.fromJson(Map<String, dynamic> json, String role) =>
      ListMessage(
        status: json["status"],
        message: json["message"],
        chatRooms: List<ChatRoom>.from(
          json["chat_rooms"].map(
            (x) =>
                ChatRoom.fromJson(x, role == "patient" ? "doctor" : "patient"),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "chat_rooms": List<dynamic>.from(chatRooms.map((x) => x.toJson())),
  };
}

class ChatRoom {
  final String id;
  final Details details;
  final DateTime createdAt;

  ChatRoom({required this.id, required this.details, required this.createdAt});

  ChatRoom copyWith({String? id, Details? details, DateTime? createdAt}) =>
      ChatRoom(
        id: id ?? this.id,
        details: details ?? this.details,
        createdAt: createdAt ?? this.createdAt,
      );

  factory ChatRoom.fromJson(Map<String, dynamic> json, String role) => ChatRoom(
    id: json["id"],
    details: Details.fromJson(json[role == "patient" ? "doctor" : "patient"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor": details.toJson(),
    "created_at": createdAt.toIso8601String(),
  };
}

class Details {
  final int id;
  final String name;
  final dynamic imageUrl;
  final String? lastMessage;
  final DateTime? lastMessageTime;

  Details({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  Details copyWith({
    int? id,
    String? name,
    dynamic imageUrl,
    String? lastMessage,
    DateTime? lastMessageTime,
  }) => Details(
    id: id ?? this.id,
    name: name ?? this.name,
    imageUrl: imageUrl ?? this.imageUrl,
    lastMessage: lastMessage ?? this.lastMessage,
    lastMessageTime: lastMessageTime ?? this.lastMessageTime,
  );

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    id: json["id"] ?? "",
    name: json["name"],
    imageUrl: json["image_url"],
    lastMessage: json["lastMessage"],
    lastMessageTime:
        json["lastMessageTime"] == null
            ? null
            : DateTime.parse(json["lastMessageTime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_url": imageUrl,
    "lastMessage": lastMessage,
    "lastMessageTime": lastMessageTime?.toIso8601String(),
  };
}
