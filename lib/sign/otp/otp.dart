import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:talky/globals/enum_colors.dart';
import 'package:talky/globals/routes.dart';
import 'package:talky/globals/style.dart';
import 'package:talky/provider.dart';
import 'package:talky/sign/sign_button.dart';

class Otp extends StatefulWidget {
  const Otp({
    super.key,
  });

  @override
  OtpState createState() => OtpState();
}

class OtpState extends State<Otp> {
  late FireProvider provider;
  String otp = '';
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
    User? user = provider.controller.getUser();
    if (user != null) {
      if (provider.controller.isVerified(user)) {
        Navigator.pushNamed(context, Routes.signUpProfile);
      }
    }
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
                  "Enter the 6 digit codes we send to you",
                  textAlign: TextAlign.center,
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
                OtpTextField(
                  numberOfFields: 6,
                  borderRadius: BorderRadius.circular(8),
                  borderColor:
                      Style.t3Colors[EColors.black]![ESelection3.light]!,
                  showFieldAsBox: true,
                  fieldWidth:
                      MediaQuery.of(context).size.width * 40 / Style.width,
                  fieldHeight:
                      MediaQuery.of(context).size.height * 40 / Style.height,
                  textStyle: Style.inter(
                    color: EColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    t3Selection: ESelection3.primary,
                  ),
                  contentPadding: EdgeInsets.only(
                    bottom:
                        MediaQuery.of(context).size.height * 10 / Style.height,
                  ),
                  // onCodeChanged: (text) {
                  //   otp = text;
                  // },
                  onSubmit: (text) {
                    otp = text;
                  },
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 252 / Style.height,
                ),
                SignButton(
                  onTapDown: (details) {
                    final verified =
                        provider.controller.verifyEmail(otp, context);
                    if (verified) {
                      Navigator.pushNamed(context, Routes.signUpProfile);
                    }
                  },
                  text: "Sign up",
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
                  "Already have an account?",
                  style: Style.inter(
                    color: EColors.black,
                    t3Selection: ESelection3.primary,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTapDown: (details) {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.signInWithMail,
                    );
                  },
                  child: Text(
                    "Sign in here",
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
