import 'package:flutter/material.dart';
import 'package:talky/sign/otp/otp.dart';
import 'package:talky/sign/sign_in/mail/sign_in_with_mail.dart';
import 'package:talky/sign/sign_up/mail/sign_up_with_mail.dart';
import 'package:talky/sign/sign_in/sign_in.dart';
import 'package:talky/sign/sign_up/sign_up.dart';
import 'package:talky/splash/splash_screen.dart';

class Routes {
  static const splash = "/splash";
  static const signIn = "/signIn";
  static const signInWithMail = "/signInWithMail";
  static const signUp = "/signUp";
  static const signUpWithMail = "/signUpWithMail";
  static const otp = "/otp";
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final WidgetBuilder builder = switch (settings.name) {
      signIn => (context) => const SignIn(),
      signInWithMail => (context) => const SignInWithMail(),
      signUp => (context) => const SignUp(),
      splash => (context) => const SplashScreen(),
      signUpWithMail => (context) => const SignUpWithMail(),
      otp => (context) => const Otp(),
      _ => (context) => const Otp(),
    };
    return MaterialPageRoute(
      settings: settings,
      builder: builder,
    );
  }
}
