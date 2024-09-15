import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:show_hide_password/show_hide_password.dart';
import 'package:talky/globals/enum_colors.dart';
import 'package:talky/globals/routes.dart';
import 'package:talky/globals/style.dart';
import 'package:talky/provider.dart';
import 'package:talky/sign/eye_icon.dart';
import 'package:talky/sign/input_field.dart';
import 'package:talky/sign/sign_button.dart';

class SignInWithMail extends StatefulWidget {
  const SignInWithMail({
    super.key,
  });

  @override
  SignInWithMailState createState() => SignInWithMailState();
}

class SignInWithMailState extends State<SignInWithMail> {
  String email = '';
  String password = "";
  late FireProvider provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<FireProvider>(
      context,
      listen: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.t3Colors[EColors.background]![ESelection3.primary],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTapDown: (details) {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: Row(
              children: [
                Container(
                  height:
                      MediaQuery.of(context).size.height * 30 / Style.height,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Style.t2Colors[EColors.blue]![ESelection2.secondary],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical:
                        MediaQuery.of(context).size.height * 6 / Style.height,
                    horizontal:
                        MediaQuery.of(context).size.width * 6 / Style.width,
                  ),
                  child: SvgPicture.asset(
                    "assets/back.svg",
                    height:
                        MediaQuery.of(context).size.height * 12 / Style.height,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 6 / Style.width,
                ),
                Text(
                  "Back",
                  style: Style.inter(
                    color: EColors.blue,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 28 / Style.width,
          ),
          child: SingleChildScrollView(
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
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: ".",
                          style: Style.inter(
                            color: EColors.blue,
                            t2Selection: ESelection2.primary,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 40 / Style.height,
                ),
                Text(
                  "Sign in with Mail",
                  style: Style.inter(
                    color: EColors.black,
                    t3Selection: ESelection3.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 40 / Style.height,
                ),
                InputField(
                  autoFocus: true,
                  hint: "Enter your mail address",
                  onChanged: (str) {
                    email = str;
                  },
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 18 / Style.height,
                ),
                ShowHidePassword(
                  visibleOnIcon: CustomIcons.eye,
                  passwordField: (bool hidePassword) {
                    return InputField(
                      obscure: hidePassword,
                      hint: "Enter your password",
                      onChanged: (str) {
                        password = str;
                      },
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width * 20 / Style.width,
                    vertical:
                        MediaQuery.of(context).size.height * 18 / Style.height,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTapDown: (details) {},
                      child: Text(
                        "Forgot password?",
                        style: Style.inter(
                          color: EColors.black,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          shadows: [
                            const Shadow(
                              color: Colors.black,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 163 / Style.height,
                ),
                SignButton(
                  onTapDown: (details) {
                    provider.controller.signInWithMail(email, password);
                  },
                  text: "Sign in",
                  mainAxisAlignment: MainAxisAlignment.center,
                  // bgColor: Style.t2Colors[EColors.blue]![ESelection2.primary]!,
                  textStyle: Style.inter(
                    color: EColors.background,
                    t3Selection: ESelection3.primary,
                    fontSize: 18,
                  ),
                  decoration: BoxDecoration(
                    color: Style.t2Colors[EColors.blue]![ESelection2.primary]!,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 30 / Style.height,
                ),
                Text(
                  "Don’t have an account?",
                  style: Style.inter(
                    color: EColors.black,
                    t3Selection: ESelection3.primary,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTapDown: (details) {
                    Navigator.pushReplacementNamed(
                        context, Routes.signUpWithMail);
                  },
                  child: Text(
                    "Sign up here",
                    style: Style.inter(
                      color: EColors.blue,
                      t3Selection: ESelection3.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
