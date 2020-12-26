import 'package:chatapp/auth/user_authentication.dart';
import 'package:chatapp/utils/constants.dart';
import 'package:chatapp/utils/validation.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_rounded_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _valid = 'valid info';

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  void _registerUser() {
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
            .createUser(_emailController.text, _passwordController.text);
      }
    });
  }

  void _createUser() async {
    try {
      print(_emailController.text);
      print(_passwordController.text);
      final user = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      if (user != null) {
        Navigator.pushReplacementNamed(context, kChatRoute);
      }
    } catch (e) {
      print(e);
    }
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
            Flexible(
              child: Hero(
                tag: kHeroTag,
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/app_icon.png'),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            RoundedTextField(
              errorText: Validation.emailError,
              controller: _emailController,
              hint: 'Email',
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(height: kSizedBoxHeight),
            RoundedTextField(
              errorText: Validation.passwordError,
              controller: _passwordController,
              hideFieldText: true,
              hint: 'Password',
            ),
            SizedBox(height: kSizedBoxHeight),
            CustomRoundedButton(
              label: 'Register',
              decoration: kRegisterButtonDecoration,
              onPressed: () => _registerUser(),
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
