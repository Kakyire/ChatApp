import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    @required this.label,
    @required this.decoration,
    @required this.onPressed,
  });

  final Decoration decoration;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: FlatButton(
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
