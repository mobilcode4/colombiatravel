// ignore_for_file: library_prefixes

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/models/User.dart';

class FirebaseApi {
  Future<String?> registerUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthExeption ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseExeption ${e.code}");
      return e.code;
    }
  }

  Future<String?> logInUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //Check info
      var userEmail = credential.user?.email;
      print('userEmail: $userEmail');
      // try {
      //   CollectionReference users =
      //       FirebaseFirestore.instance.collection('users');
      //   final snapshot = await users.doc(userEmail).get();
      //   final data = snapshot.data() as Map<String, dynamic>;
      //   var fav = data['favoritesGenres'];
      //   print('favoritesGenres: $fav');
      // } catch (e) {
      //   return 'Error fetching user:';
      // }
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthExeption ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseExeption ${e.code}");
      return e.code;
    }
  }

  Future<String> createUser(UserApp user) async {
    try {
      final document = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set(user.toJson());
      return user.uid;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }
}
