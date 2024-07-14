import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final bool? readOnly;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      required this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.validator,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      readOnly: readOnly!,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.grey),
          // border only bottom
          border: const UnderlineInputBorder(),
          // border all side
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: isPassword ? suffixIcon : null),
      validator: validator,
    );
  }
}
