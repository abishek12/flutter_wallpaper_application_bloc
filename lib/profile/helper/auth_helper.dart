import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  final _instance = FirebaseAuth.instance;
  Future<void> loginUser(String email, String password) async {
    try {
      await _instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> createUser(
      String fullname, String email, String password) async {
    try {
      final users = FirebaseFirestore.instance.collection('users');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        final id = value.user!.uid;
        users.doc(id).set({
          "fullname": fullname,
          "email": email,
          "password": password,
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      }
    } catch (e) {
      throw ('$e');
    }
  }
}
