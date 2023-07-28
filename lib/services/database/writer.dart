import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataWriter {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> create() async {
    try {
      await _firestore.collection('tasks').add(
        {
          'task': 'Complete Assesment',
          'deadline': 'Sunady',
        },
      );

      debugPrint("Data Created Successfully");
    } catch (e) {
      debugPrint(e.toString());
      throw ("Some Error Occurred");
    }
  }
}
