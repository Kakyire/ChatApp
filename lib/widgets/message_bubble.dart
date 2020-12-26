import 'package:chatapp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.isSender, {
    this.message,
  });

  final String message;
  final bool isSender;

  BorderRadiusGeometry _checkCurrentUser() {
    return isSender
        ? BorderRadius.only(
            topLeft: kBubbleRadius,
            bottomLeft: kBubbleRadius,
            bottomRight: kBubbleRadius,
          )
        : BorderRadius.only(
            topRight: kBubbleRadius,
            bottomLeft: kBubbleRadius,
            bottomRight: kBubbleRadius,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Material(
            borderRadius: _checkCurrentUser(),
            elevation: 2.0,
            color: isSender ? kAppBlueColor : Colors.teal,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Text(
                message,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
