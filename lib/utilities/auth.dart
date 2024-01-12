import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import '../models/models.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// create user
  Future<UserModel?> signUpUser(
    String name,
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return UserModel(
          id: firebaseUser.uid, 
          email: firebaseUser.email ?? '',
          name: firebaseUser.displayName ?? '',
        );
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> signInWithCredentials(String email, String password) async {
    try {
      _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  } 

  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? UserModel.empty : firebaseUser.toUser;
      return user;
    });
  }

   ///signOutUser 
  Future<void> signOutUser() async {
      final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
  // ... (other methods)}
}

extension on User {
  /// Maps a [firebase_auth.User] into a [User].
  UserModel get toUser {
    return UserModel(id: uid, email: email, name: displayName);
  }
}