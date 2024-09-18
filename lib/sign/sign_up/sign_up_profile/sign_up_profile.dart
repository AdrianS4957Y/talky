import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validation/form_validation.dart';
import 'package:provider/provider.dart';
import 'package:show_hide_password/show_hide_password.dart';
import 'package:talky/globals/enum_colors.dart';
import 'package:talky/globals/routes.dart';
import 'package:talky/globals/style.dart';
import 'package:talky/provider.dart';
import 'package:talky/sign/custom_checkbox.dart';
import 'package:talky/sign/eye_icon.dart';
import 'package:talky/sign/input_field.dart';
import 'package:talky/sign/sign_button.dart';

class SignUpProfile extends StatefulWidget {
  const SignUpProfile({
    super.key,
  });

  @override
  SignUpProfileState createState() => SignUpProfileState();
}

class SignUpProfileState extends State<SignUpProfile> {
  String email = '';
  String password = "";
  bool checked = false;
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
            child: Form(
              autovalidateMode: AutovalidateMode.always,
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
                    "Sign up with Mail",
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
                    validator: (value) {
                      final validator = Validator(
                        validators: [
                          const RequiredValidator(),
                          const EmailValidator(),
                        ],
                      );
                      return validator.validate(
                        label: "Required",
                        value: value,
                      );
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
                        validator: (value) {
                          final validator = Validator(
                            validators: [
                              const RequiredValidator(),
                              const MinLengthValidator(
                                length: 6,
                              ),
                            ],
                          );
                          return validator.validate(
                            label: "Required",
                            value: value,
                          );
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width * 20 / Style.width,
                      vertical: MediaQuery.of(context).size.height *
                          18 /
                          Style.height,
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
                        MediaQuery.of(context).size.height * 40 / Style.height,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            24 /
                            Style.height,
                        child: CustomCheckbox(
                          borderColor:
                              Style.t3Colors[EColors.black]![ESelection3.light],
                          size: MediaQuery.of(context).size.width *
                              24 /
                              Style.width,
                          onChanged: (state) {
                            setState(() {
                              checked = state;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            10 /
                            Style.width,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "I agree to the ",
                          style: Style.inter(
                            color: EColors.black,
                            fontSize: 12,
                            decorationColor: Colors.black,
                            shadows: [
                              const Shadow(
                                color: Colors.black,
                                offset: Offset(0, -2),
                              ),
                            ],
                          ),
                          children: [
                            TextSpan(
                              text: "terms & conditions",
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 99 / Style.height,
                  ),
                  SignButton(
                    onTapDown: (details) {
                      if (!checked) {
                        return;
                      }
                      Navigator.pushNamed(context, Routes.otp);
                    },
                    text: "Sign up",
                    mainAxisAlignment: MainAxisAlignment.center,
                    textStyle: Style.inter(
                      color: EColors.background,
                      t3Selection: ESelection3.primary,
                      fontSize: 18,
                    ),
                    decoration: BoxDecoration(
                      color: checked
                          ? Style.t2Colors[EColors.blue]![ESelection2.primary]
                          : Style.t3Colors[EColors.black]![ESelection3.light]!,
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
                          context, Routes.signInWithMail);
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
      ),
    );
  }
}
