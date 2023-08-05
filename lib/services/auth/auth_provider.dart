import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/models/user_auth.dart';

class AuthProvider {
  static final auth = FirebaseAuth.instance;
  static final firestore = FirebaseFirestore.instance;

  static Future<UserCredential?> register(
      BuildContext context, String password, String email, String name) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await user.user!.sendEmailVerification();

      final data = UserAuth(
        name: name,
        email: email,
        id: user.user!.uid,
      );

      await firestore.collection('users').doc(user.user!.uid).set(data.toMap());

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The password provided is too weak.')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The account already exists for that email.')));
      }
      return null;
    } catch (e) {
      debugPrint("Error in Auth Provider");
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<UserAuth?> login(
      BuildContext context, String email, String password) async {
    try {
      final creds = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final raw =
          await firestore.collection('users').doc(creds.user!.uid).get();

      final data = UserAuth.fromMap(raw.data()!);

      return data;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('User Not Found!.')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid Email or password!')));
      }
    } catch (e) {
      debugPrint("Error in Auth Provider");
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<void> logout() async {
    await auth.signOut();
  }
}
