// To parse this JSON data, do
//
//     final chatRequestModel = chatRequestModelFromJson(jsonString);

import 'dart:convert';

ChatRequestModel chatRequestModelFromJson(String str) =>
    ChatRequestModel.fromJson(json.decode(str));

String chatRequestModelToJson(ChatRequestModel data) =>
    json.encode(data.toJson());

class ChatRequestModel {
  final int senderId;
  final int reciverId;
  final String message;
  final DateTime timestamp;
  bool isRead = false;

  ChatRequestModel({
    required this.senderId,
    required this.reciverId,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });

  ChatRequestModel copyWith({
    int? senderId,
    int? reciverId,
    String? message,
    DateTime? timestamp,
    bool? isRead,
  }) => ChatRequestModel(
    senderId: senderId ?? this.senderId,
    reciverId: reciverId ?? this.reciverId,
    message: message ?? this.message,
    timestamp: timestamp ?? this.timestamp,
    isRead: isRead ?? this.isRead,
  );

  factory ChatRequestModel.fromJson(Map<String, dynamic> json) =>
      ChatRequestModel(
        senderId: json["sender_id"],
        reciverId: json["reciver_id"],
        message: json["message"],
        timestamp: DateTime.parse(json["timestamp"]),
        isRead: json["is_read"],
      );

  Map<String, dynamic> toJson() => {
    "sender_id": senderId,
    "reciver_id": reciverId,
    "message": message,
    "timestamp": timestamp.toIso8601String(),
    "is_read": isRead,
  };
}
