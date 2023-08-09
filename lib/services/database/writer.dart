import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class DataWriter {
  static final _firestore = FirebaseFirestore.instance;
  static final _uuid = Uuid();

  static Future<void> create(String taskTitle, String taskDescription) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw "User not authenticated"; // Handle this properly in your UI
    }

    try {
      String documentId = _uuid.v4();
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .doc(documentId)
          .set({
        'id': documentId,
        'title': taskTitle,
        'Desc': taskDescription,
      });

      print("Data Created Successfully");
    } catch (e) {
      print(e.toString());
      throw "Some Error Occurred";
    }
  }

  static Future<void> delete(String documentId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw "User not authenticated"; // Handle this properly in your UI
    }

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .doc(documentId)
          .delete();
      print("Data Deleted Successfully");
    } catch (e) {
      print(e.toString());
      throw "Some Error Occurred";
    }
  }
}
