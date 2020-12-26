import 'package:chatapp/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  RoundedTextField({
    this.inputType,
    @required this.hint,
    this.hideFieldText = false,
    this.onChanged,
    this.controller,
    this.errorText,
    this.fillColor,
    this.filled,
    this.textColor,
    this.cursorColor,
    this.hintColor,
  });

  final TextInputType inputType;
  final String hint;
  final bool hideFieldText;
  final Function onChanged;
  final TextEditingController controller;
  final String errorText;
  final Color fillColor;
  final bool filled;
  final Color textColor;
  final Color cursorColor;
  final Color hintColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: cursorColor,
      style: TextStyle(color: textColor),
      obscureText: hideFieldText,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      decoration: kTextFieldDecoration.copyWith(
        hintText: hint,
        hintStyle: TextStyle(color: hintColor),
        errorText: errorText,
        fillColor: fillColor,
        filled: filled,
      ),
    );
  }
}
