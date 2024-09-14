import 'package:flutter/material.dart';
import 'package:talky/globals/enum_colors.dart';
import 'package:talky/globals/style.dart';

class SignInWithMail extends StatefulWidget {
  const SignInWithMail({
    super.key,
  });

  @override
  SignInWithMailState createState() => SignInWithMailState();
}

class SignInWithMailState extends State<SignInWithMail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 28 / Style.width,
          ),
          child: Column(
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
