import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DeleteData {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> delete(String documentId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw "User not authenticated";
      }

      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .doc(documentId)
          .delete();
      debugPrint("Task deleted Successfully");
    } catch (e) {
      debugPrint(e.toString());
      throw "Some Error Occurred";
    }
  }
}
