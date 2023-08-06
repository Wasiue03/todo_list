import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../TaskProvider/task_provider.dart';

class DataReader {
  static final firestore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchTask() {
    return firestore
        .collection('users')
        .doc(getCurrentUserUID())
        .collection('tasks')
        .snapshots();
  }

  static Future<List<Task>> getUserTasks() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return [];

    final tasksCollection =
        firestore.collection('users').doc(user.uid).collection('tasks');

    final querySnapshot = await tasksCollection.get();

    final tasks =
        querySnapshot.docs.map((doc) => Task.fromMap(doc.data())).toList();

    return tasks;
  }

  static String getCurrentUserUID() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    return '';
  }
}
