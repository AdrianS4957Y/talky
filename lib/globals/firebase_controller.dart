import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talky/firebase_options.dart';
import 'package:talky/globals/e_verified.dart';
import 'package:talky/globals/enum_colors.dart';
import 'package:talky/globals/style.dart';
const Map<EVerified, String> verifyStatus = {
  EVerified.unverified: "Unverified",
  EVerified.verified: "Verified",
}
class FirebaseController {
  late bool shouldUseFirebaseEmulator;
  late FirebaseApp _app;
  late FirebaseAuth _auth;

  // EmailAuth eAuth = EmailAuth(sessionName: "Current session");

  FirebaseController.init({this.shouldUseFirebaseEmulator = false}) {
    WidgetsFlutterBinding.ensureInitialized();
    Future.sync(() async {
      _app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      _auth = FirebaseAuth.instanceFor(app: _app);
      EmailOTP.config(
        appName: "Talky",
        otpLength: 6,
        otpType: OTPType.numeric,
      );
      // EmailOTP.setSMTP(
      //   emailPort: EmailPort.port587,
      //   secureType: SecureType.ssl,
      //   host: "outlook.live.com",
      //   username: "Anvarjon",
      //   password: "\$AdrianS4957Y",
      // );
      if (shouldUseFirebaseEmulator) {
        await _auth.useAuthEmulator('localhost', 9099);
      }
    });
  }
  Future<UserCredential?> signUpWithMail(
      String email, String password, BuildContext context) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      handleError(e, context);
      return null;
    }
  }

  Future<UserCredential?> signInWithMail(
      String email, String password, BuildContext context) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      handleError(e, context);
      return null;
    }
  }

  Future<UserCredential?> signInWithGoogle(
    BuildContext context,
  ) async {
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
    } on FirebaseAuthException catch (e) {
      handleError(e, context);
      return null;
    }
  }

  User? getUser() {
    return _auth.currentUser;
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        EmailOTP.sendOTP(email: user.email!);
        user.updateDisplayName("${verifyStatus[EVerified.unverified]}${user.displayName ?? ''}");
        // eAuth.sendOtp(recipientMail: user.email!);
      }
    } on FirebaseAuthException catch (e) {
      handleError(e, context);
    } catch (e) {
      handleError(e, context);
    }
  }

  bool verifyEmail(String otp, BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      bool verified = EmailOTP.verifyOTP(otp: otp);
      user.updateDisplayName(
        (user.displayName ?? '').replaceFirst(verifyStatus[EVerified.unverified]!, verifyStatus[EVerified.unverified]!),
      );
      return verified;
      // return eAuth.validateOtp(recipientMail: user.email!, userOtp: otp);
    }
    return false;
  }
  String getUserName(User? user){
    if (user == null) {
      return "";
    }
    String name = user.displayName ?? "";
    if(name.startsWith(verifyStatus[EVerified.unverified]!)){
      return name.substring(verifyStatus[EVerified.unverified]!.length);
    }else
    if(name.startsWith(verifyStatus[EVerified.verified]!)){
      return name.substring(verifyStatus[EVerified.verified]!.length);
    }
    return "";
  }
  bool isVerified(User? user) {
    if (user == null) {
      return false;
    }
    return (user.displayName ?? "").startsWith(verifyStatus[EVerified.verified]!);
  }

  handleError(Object e, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(
        "Undefined error",
        style: Style.inter(
          color: EColors.red,
          t2Selection: ESelection2.primary,
          fontSize: 18,
        ),
      ),
    );
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case "email-already-in-use":
          snackBar = SnackBar(
            content: Text(
              "Sorry, but email is already in use",
              style: Style.inter(
                color: EColors.red,
                t2Selection: ESelection2.primary,
                fontSize: 18,
              ),
            ),
          );
        case "invalid-credential":
          snackBar = SnackBar(
            content: Text(
              "Invalid credentials",
              style: Style.inter(
                color: EColors.red,
                t2Selection: ESelection2.primary,
                fontSize: 18,
              ),
            ),
          );
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
