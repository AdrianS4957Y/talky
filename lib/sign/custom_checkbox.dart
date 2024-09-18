import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final Color? borderColor;
  final double? size;
  final Function(bool)? onChanged;
  const CustomCheckbox({
    super.key,
    this.borderColor,
    this.size,
    this.onChanged,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: isChecked ? Colors.blue : Colors.transparent,
        border: Border.all(
          color: widget.borderColor ?? Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(2),
        shape: BoxShape.rectangle,
      ),
      child: Transform.scale(
        scale: 1.0,
        child: Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            isChecked = value ?? false;
            if (widget.onChanged != null) {
              widget.onChanged!(isChecked);
            }
          },
          activeColor: Colors.blue,
          checkColor: Colors.white,
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
