import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final bool obscureText;

  const AuthTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.blue[900],
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.blue.shade900),
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade900, width: 2)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
