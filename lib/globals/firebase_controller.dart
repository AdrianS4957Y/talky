import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talky/firebase_options.dart';

class FirebaseController {
  late bool shouldUseFirebaseEmulator;
  late FirebaseApp _app;
  late FirebaseAuth _auth;

  FirebaseController.init({this.shouldUseFirebaseEmulator = false}) {
    WidgetsFlutterBinding.ensureInitialized();
    Future.sync(() async {
      _app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      _auth = FirebaseAuth.instanceFor(app: _app);
      if (shouldUseFirebaseEmulator) {
        await _auth.useAuthEmulator('localhost', 9099);
      }
    });
  }
  Future<UserCredential?> signUpWithMail(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<UserCredential?> signInWithMail(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    const scopes = [
      'email',
      'profile',
    ];
    try {
      final googleSignIn = GoogleSignIn(
        scopes: scopes,
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException {
      return null;
    }
  }

  User? getUser() {
    return _auth.currentUser;
  }
}
