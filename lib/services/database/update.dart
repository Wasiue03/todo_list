import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UpdateData {
  static final firestore = FirebaseFirestore.instance;

  static final _uuid = Uuid();

  static Future<void> update() async {
    try {
      String documentId = _uuid.v4();
      // You can update the data in Firestore using the "update" method
      await firestore.collection('tasks').doc(documentId).update({
        'title': 'Up',
        'subtitle': 'down',
      });
      debugPrint('Document Updated Successfully!');
    } catch (e) {
      debugPrint('Error updating document: $e');
    }
  }
}
