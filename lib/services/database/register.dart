import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserWriter {
  static final _firestore = FirebaseFirestore.instance;
  static final _uuid = Uuid();
  static Future<void> create(String name, String email, String dob) async {
    try {
      String documentId = _uuid.v4();
      await _firestore.collection('users').doc(documentId).set({
        'id': documentId,
        'name': name,
        'email': email,
        'dob': dob,
      });

      debugPrint("Data Created Successfully");
    } catch (e) {
      debugPrint(e.toString());
      throw ("Some Error Occurred");
    }
  }
}
