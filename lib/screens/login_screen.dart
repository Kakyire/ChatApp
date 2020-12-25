import 'package:chatapp/auth/user_authentication.dart';
import 'package:chatapp/utils/constants.dart';
import 'package:chatapp/utils/validation.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_rounded_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _valid = 'valid info';

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  void _login() {
    setState(() {
      Validation.passwordError = null;
      Validation.emailError = null;
      var validCredential = Validation.validateEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );

      if (validCredential == _valid) {
        print(_valid);
        UserAuthentication(context: context)
            .signUserIn(_emailController.text, _passwordController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: kHeroTag,
              child: Container(
                height: 200.0,
                child: Image.asset('images/app_icon.png'),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            RoundedTextField(
              hint: 'Email',
              controller: _emailController,
              inputType: TextInputType.emailAddress,
              errorText: Validation.emailError,
            ),
            SizedBox(height: kSizedBoxHeight),
            RoundedTextField(
              hideFieldText: true,
              hint: 'Password',
              controller: _passwordController,
              errorText: Validation.passwordError,
            ),
            SizedBox(height: kSizedBoxHeight),
            CustomRoundedButton(
              label: 'Login',
              decoration: kLoginButtonDecoration,
              onPressed: () => _login(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    Validation.resetErrorFields();
    super.dispose();
  }
}
