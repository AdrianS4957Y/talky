import 'package:flutter/material.dart';
import 'package:talky/globals/routes.dart';
import 'package:talky/sign/or.dart';
import 'package:talky/sign/sign_button.dart';

import '../../globals/enum_colors.dart';
import '../../globals/style.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    super.key,
  });

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.t3Colors[EColors.background]![ESelection3.primary],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 28 / Style.width,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 71 / Style.height,
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: "Talky",
                    style: Style.inter(
                      color: EColors.black,
                      t3Selection: ESelection3.primary,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: ".",
                        style: Style.inter(
                          color: EColors.blue,
                          t2Selection: ESelection2.primary,
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 230 / Style.height,
              ),
              SignButton(
                onTapDown: (details) {},
                image: "assets/google.svg",
                text: "Sign in with Google",
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      MediaQuery.of(context).size.width * 40 / Style.width,
                ),
                height: MediaQuery.of(context).size.height * 80 / Style.height,
                child: const Center(
                  child: Or(),
                ),
              ),
              SignButton(
                onTapDown: (details) {
                  Navigator.pushNamed(context, Routes.signInWithMail);
                },
                image: "assets/email.svg",
                text: "Continue with Mail",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 56 / Style.height,
              ),
              Text(
                "Don’t have an account?",
                style: Style.inter(
                  color: EColors.black,
                  t3Selection: ESelection3.primary,
                  fontSize: 14,
                ),
              ),
              Text(
                "Sign up here",
                style: Style.inter(
                  color: EColors.blue,
                  t3Selection: ESelection3.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
