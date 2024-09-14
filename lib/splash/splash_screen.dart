import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talky/globals/routes.dart';

import '../globals/enum_colors.dart';
import '../globals/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, Routes.signIn);
    });
    return Scaffold(
      backgroundColor: Style.t2Colors[EColors.blue]![ESelection2.primary],
      body: Center(
        child: RichText(
          text: TextSpan(
              text: "Talky",
              style: Style.inter(
                  color: EColors.background,
                  t3Selection: ESelection3.primary,
                  fontSize: 80,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: ".",
                  style: Style.inter(
                      color: EColors.black,
                      t3Selection: ESelection3.primary,
                      fontSize: 80,
                      fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ),
    );
  }
}
