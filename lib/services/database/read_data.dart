import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DataReader {
  static final firestore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchTask() {
    try {
      return firestore.collection('tasks').snapshots().asBroadcastStream();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
