import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatasource {
  static final FirebaseDatasource _instance = FirebaseDatasource._internal();

  factory FirebaseDatasource() {
    return _instance;
  }
  final CollectionReference<Map<String, dynamic>> chatRoomsCollection =
      FirebaseFirestore.instance.collection('chat_rooms');

  FirebaseDatasource._internal();
}
