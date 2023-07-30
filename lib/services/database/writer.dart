import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DataWriter {
  static final _firestore = FirebaseFirestore.instance;
  static final _uuid = Uuid();
  static Future<void> create(String taskTitle, String taskDescription) async {
    try {
      String documentId = _uuid.v4();
      await _firestore.collection('tasks').doc(documentId).set({
        'id': documentId,
        'title': taskTitle,
        'Desc': taskDescription,
      });

      debugPrint("Data Created Successfully");
    } catch (e) {
      debugPrint(e.toString());
      throw ("Some Error Occurred");
    }
  }
}
