import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatapp/utils/constants.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animation = ColorTween(begin: kAppBlueColor, end: Colors.white)
        .animate(_animationController);

    _animationController.forward();
    _animationController.addListener(() {
      setState(() {
        print(_animation.value);
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value, //Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kSizedBoxHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: kHeroTag,
                  child: Container(
                    height: _animationController.value * 60.0,
                    child: Image.asset('images/app_icon.png'),
                  ),
                ),
                ColorizeAnimatedTextKit(
                  text: ['Chat App'],
                  colors: [
                    Colors.teal,
                    kAppBlueColor,
                    Colors.grey,
                  ],
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                  ),
                  repeatForever: true,
                ),
              ],
            ),
            SizedBox(height: 50.0),
            CustomRoundedButton(
              label: 'Login',
              decoration: kLoginButtonDecoration,
              onPressed: () {
                Navigator.pushNamed(context, kLoginRoute);
              },
            ),
            SizedBox(height: kSizedBoxHeight),
            CustomRoundedButton(
              label: 'Register',
              decoration: kRegisterButtonDecoration,
              onPressed: () {
                Navigator.pushNamed(context, kRegistrationRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
