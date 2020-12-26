import 'package:chatapp/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:flutter/cupertino.dart';

class UserAuthentication {
  final _auth = fAuth.FirebaseAuth.instance;
  var _user;

  UserAuthentication({this.context});

  final BuildContext context;

  bool isUserLoggedIn() {
    try {
      _user = _auth.currentUser;
    } catch (e) {
      print(e);
    }

    return _user != null ? true : false;
  }

  String loggedInUser() {
    _user = _auth.currentUser;
    return _user.email;
  }

  /// Sign old user in with email and password
  /// [email] - The email field is required
  /// [password] The password field required
  void signUserIn(String email, String password) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.pushReplacementNamed(context, kChatRoute);
      }
    } catch (e) {
      print(e);
    }
  }

  /// Create new user with email and password
  /// [email] - The email field is required
  /// [password] The password field required
  void createUser(String email, String password) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.pushReplacementNamed(context, kChatRoute);
      }
    } catch (e) {
      print(e);
    }
  }

  void signOut() {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, kWelcomeRoute);
  }
}
