

import 'dart:convert';

List<TelemedisResponseModel> telemedisResponseModelFromJson(String str) => List<TelemedisResponseModel>.from(json.decode(str).map((x) => TelemedisResponseModel.fromJson(x)));

String telemedisResponseModelToJson(List<TelemedisResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TelemedisResponseModel {
    int id;
    String callRoomUid;
    String callToken;
    DateTime expiredToken;
    String callChannel;
    int patientId;
    int doctorId;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    TelemedisResponseModel({
        required this.id,
        required this.callRoomUid,
        required this.callToken,
        required this.expiredToken,
        required this.callChannel,
        required this.patientId,
        required this.doctorId,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory TelemedisResponseModel.fromJson(Map<String, dynamic> json) => TelemedisResponseModel(
        id: json["id"],
        callRoomUid: json["call_room_uid"],
        callToken: json["call_token"],
        expiredToken: DateTime.parse(json["expired_token"]),
        callChannel: json["call_channel"],
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
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
        "patient_id": patientId,
        "doctor_id": doctorId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
