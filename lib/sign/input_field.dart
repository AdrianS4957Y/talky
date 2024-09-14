import 'package:flutter/material.dart';
import 'package:talky/globals/enum_colors.dart';
import 'package:talky/globals/style.dart';

class InputField extends StatefulWidget {
  final bool? obscure;
  final bool? autoFocus;
  final String? hint;
  final TextStyle? hintStyle;
  const InputField({
    super.key,
    this.obscure,
    this.autoFocus,
    this.hint,
    this.hintStyle,
  });

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autoFocus ?? false,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: widget.hintStyle ??
            Style.inter(
              color: EColors.black,
              t3Selection: ESelection3.light,
              fontSize: 14,
            ),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Style.t3Colors[EColors.black]![ESelection3.light]!,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Style.t2Colors[EColors.blue]![ESelection2.primary]!,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      cursorColor: Style.t2Colors[EColors.blue]![ESelection2.primary]!,
      cursorWidth: 1,
      obscureText: widget.obscure ?? false,
    );
  }
}
