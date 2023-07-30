import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteData {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> delete(String documentId) async {
    try {
      await _firestore.collection('tasks').doc(documentId).delete();
      debugPrint("Task delted Successfully");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
