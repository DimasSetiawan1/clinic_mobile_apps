class ChatRequestModel {
  final String? lastMessage;
  final String? lastMessageTime;
  final Messages? messages;

  ChatRequestModel({this.lastMessage, this.lastMessageTime, this.messages});
  Map<String, dynamic> toJson() {
    return {
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'messages': messages?.toJson(),
    };
  }

  factory ChatRequestModel.fromJson(Map<String, dynamic> json) {
    return ChatRequestModel(
      lastMessage: json['last_message'],
      lastMessageTime: json['last_message_time'],
      messages:
          json['messages'] != null ? Messages.fromJson(json['messages']) : null,
    );
  }
}

class Messages {
  final int? senderId;
  final int? reciverId;
  final String? message;
  final String? timestamp;

  Messages({this.senderId, this.reciverId, this.message, this.timestamp});

  Map<String, dynamic> toJson() {
    return {
      'sender_id': senderId,
      'reciver_id': reciverId,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
      senderId: json['sender_id'],
      reciverId: json['reciver_id'],
      message: json['message'],
      timestamp: json['timestamp'],
    );
  }
}
