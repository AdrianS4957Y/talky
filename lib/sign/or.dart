import 'package:flutter/material.dart';
import 'package:talky/globals/enum_colors.dart';
import 'package:talky/globals/style.dart';

class Or extends StatefulWidget {
  const Or({
    super.key,
  });

  @override
  OrState createState() => OrState();
}

class OrState extends State<Or> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width * 100 / Style.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: Style.t3Colors[EColors.black]![ESelection3.middle]!,
            ),
          ),
        ),
        Text(
          "or",
          style: Style.inter(
            color: EColors.black,
            fontSize: 14,
            t3Selection: ESelection3.middle,
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width * 100 / Style.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: Style.t3Colors[EColors.black]![ESelection3.middle]!,
            ),
          ),
        ),
      ],
    );
  }
}
