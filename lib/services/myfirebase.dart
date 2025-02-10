import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authservices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // Future<String> signUpUser(
  //     {required String email,
  //     required String password,
  //     required String name}) async {

  //   String res = "";
  //   try {

  //     print("lllllllllllllllllllllllllllllllllllllllllllllll");
  //     UserCredential credential = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     await _firestore.collection("users").doc(credential.user!.uid).set({
  //       "name": name,
  //       "email": email,
  //       "uid": credential.user!.uid,
  //     });
  //     res = "success";

  //     print("oooooooooooooooooooooooooooo $res");
  //   } catch (e) {
  //     print("oooooooooooooooooooooooooooo ${e.toString()}");

  //     return e.toString();
  //   }
  //     print("oooooooooooooooooooooooooooo $res");

  //   return res;
  // }

  // Future<String> loginUser({
  //   required String email,
  //   required String password,
  // }) async {
  //   String res = "some error occured";
  //   try {
  //     if (email.isNotEmpty || password.isNotEmpty) {
  //       await _auth.signInWithEmailAndPassword(
  //           email: email, password: password);
  //       res = "success";
  //     } else {
  //       res = "Please enter all the fields";
  //     }
  //   } catch (e) {
  //     return e.toString();
  //   }
  //   return res;
  // }
}
