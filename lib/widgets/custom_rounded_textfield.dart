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
  });

  final TextInputType inputType;
  final String hint;
  final bool hideFieldText;
  final Function onChanged;
  final TextEditingController controller;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: hideFieldText,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      decoration:
          kTextFieldDecoration.copyWith(hintText: hint, errorText: errorText),
    );
  }
}
