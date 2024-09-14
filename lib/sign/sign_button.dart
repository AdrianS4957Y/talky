import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talky/globals/enum_colors.dart';
import 'package:talky/globals/style.dart';

class SignButton extends StatefulWidget {
  final void Function(TapDownDetails) onTapDown;
  final String text;
  final Color bgColor;
  final String? image;
  const SignButton({
    required this.onTapDown,
    required this.text,
    this.image,
    this.bgColor = const Color(0xFFFFFFFF),
    super.key,
  });

  @override
  SignButtonState createState() => SignButtonState();
}

class SignButtonState extends State<SignButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTapDown,
      child: Container(
        decoration: BoxDecoration(
          color: widget.bgColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(0, 1),
              color: Color(0x19000000),
            )
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 40 / Style.width,
          vertical: MediaQuery.of(context).size.height * 20 / Style.height,
        ),
        child: Row(
          children: widget.image != null
              ? [
                  SvgPicture.asset(widget.image!),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 38 / Style.width,
                  ),
                  Text(
                    widget.text,
                    style: Style.inter(
                      color: EColors.black,
                      t3Selection: ESelection3.primary,
                      fontSize: 16,
                    ),
                  ),
                ]
              : [
                  Text(
                    widget.text,
                    style: Style.inter(
                      color: EColors.black,
                      t3Selection: ESelection3.primary,
                      fontSize: 16,
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
