
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText,borderEnable;
  final double fontSize;
  final void Function(String text)? onChanged;
  final String? Function(String? text)? validator;
  const InputField({
    super.key, 
    this.label = '', 
    this.keyboardType = TextInputType.text, 
    this.obscureText = false, 
    this.borderEnable = true,  
    this.fontSize = 15,
    this.onChanged,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(
        fontSize: fontSize,
      ),
      decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        border: borderEnable ? null : InputBorder.none,
        labelStyle: const TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.w500
        )
      ),
    );
  }
}