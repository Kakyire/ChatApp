import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//routes
const String kLoginRoute = 'login';
const String kChatRoute = 'chat';
const String kWelcomeRoute = 'welcome';
const String kRegistrationRoute = 'registration';

const String kHeroTag = 'appIcon';
//sizes
const double kSizedBoxHeight = 20.0;
const double _kBorderCircleRadius = 50.0;

//colours
const Color kAppBlueColor = Color(0XFF34CCFE);

//decorations
const InputDecoration kTextFieldDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kAppBlueColor, width: 2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(_kBorderCircleRadius),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kAppBlueColor),
    borderRadius: BorderRadius.all(
      Radius.circular(_kBorderCircleRadius),
    ),
  ),
  hintText: '',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(_kBorderCircleRadius),
    ),
  ),
);

const Radius kBubbleRadius = Radius.circular(15.0);

const BoxDecoration kLoginButtonDecoration = BoxDecoration(
  color: kAppBlueColor,
  borderRadius: BorderRadius.all(Radius.circular(30.0)),
);
const BoxDecoration kRegisterButtonDecoration = BoxDecoration(
  color: Colors.teal,
  borderRadius: BorderRadius.all(Radius.circular(30.0)),
);

//Firebase fields
const String kText = 'text';
const String kSender = 'sender';
const String kTimeStamp = 'timestamp';
const String kMessageCollection = 'messages';
