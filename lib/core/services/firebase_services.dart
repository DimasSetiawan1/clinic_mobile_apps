import 'dart:developer';

import 'package:clinic_mobile_apps/data/models/request/chat_request_model.dart';
import 'package:clinic_mobile_apps/data/models/response/room_chat_response_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String _roomsCollection = 'chat_rooms';

  // Firebase Signout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Firebase Sign In with Credentials
  Future<UserCredential> signInWithCredentials({
    required OAuthCredential credentials,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithCredential(
        credentials,
      );
      return userCredential;
    } catch (e) {
      log("Error signing in: $e");
      return Future.error("Failed to sign in with credentials");
    }
  }

  // Check check document exists
  Future<bool> checkDocumentExists({required String documentId}) async {
    try {
      DocumentSnapshot docSnapshot =
          await _db.collection(_roomsCollection).doc(documentId).get();
      return docSnapshot.exists;
    } catch (e) {
      log("Error checking document existence: $e");
      return false;
    }
  }

  // start a chat room
  Future<void> setFieldRoom({
    required String chatRoomId,
    required Map<String, dynamic> chatRoomData,
  }) async {
    try {
      final isDocumentExists = await checkDocumentExists(
        documentId: chatRoomId,
      );
      if (!isDocumentExists) {
        await _db
            .collection(_roomsCollection)
            .doc(chatRoomId)
            .set(chatRoomData);
      } else {
        log("Chat room already exists with ID: $chatRoomId ");
      }
    } catch (e) {
      log("Error starting chat room: $e");
      Future.error("Failed to start chat room");
    }
  }

  Future<void> addMessageToChatRoom({
    required String chatRoomId,
    required ChatRequestModel messageData,
  }) async {
    try {
      await _db
          .collection(_roomsCollection)
          .doc(chatRoomId)
          .collection('messages')
          .add(messageData.toJson());
      await _db.collection(_roomsCollection).doc(chatRoomId).update({
        'last_message': messageData.message,
        'last_message_time': messageData.timestamp,
      });
    } catch (e) {
      log("Error adding message to chat room: $e");
      return Future.error("Failed to add message to chat room");
    }
  }

  // Get chat room by ID
  Stream<List<ChatRequestModel>> getChatRoomById({required String chatRoomId}) {
    try {
      return _db
          .collection(_roomsCollection)
          .doc(chatRoomId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((snapshot) {
            return snapshot.docs
                .map((doc) => ChatRequestModel.fromJson(doc.data()))
                .toList();
          });
    } catch (e) {
      log("Error getting chat room by ID: $e");
      return Stream.error("Failed to get chat room by ID");
    }
  }

  // Get all chat rooms for a user
  Stream<List<RoomChatResponseModel>> getAllChatRoomsForUser({
    required int userId,
    required String role,
  }) {
    final field =
        role == "doctor" ? 'participants.doctor_id' : 'participants.patient_id';
    try {
      return _db
          .collection(_roomsCollection)
          .where(field, isEqualTo: userId)
          .snapshots()
          .asyncMap((snapshot) async {
            List<RoomChatResponseModel> results = [];

            for (var doc in snapshot.docs) {
              final data = doc.data();

              final result = RoomChatResponseModel(
                id: doc.id,
                doctorName: data['doctor_name'] ?? '',
                doctorImage: data['doctor_image'] ?? '',
                patientName: data['patient_name'] ?? '',
                patientImage: data['patient_image'] ?? '',
                createdAt:
                    data['created_at'] != null
                        ? (data['created_at'] is Timestamp
                            ? (data['created_at'] as Timestamp).toDate()
                            : DateTime.parse(data['created_at']))
                        : DateTime.now(),
                participants:
                    data['participants'] != null
                        ? Participants.fromJson(data['participants'])
                        : Participants(doctorId: 0, patientId: 0),
                lastMessage: data['last_message'] ?? "",
                lastMessageTime:
                    data['last_message_time'] == null
                        ? null
                        : (data['last_message_time'] is Timestamp
                            ? (data['last_message_time'] as Timestamp).toDate()
                            : DateTime.tryParse(
                              data['last_message_time'].toString(),
                            )),
              );

              results.add(result);
            }

            return results;
          });
    } catch (e) {
      log("Error getting all chat rooms for user: $e");
      return Stream.error("Failed to get chat rooms for user");
    }
  }
}
