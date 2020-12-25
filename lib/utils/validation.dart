import 'package:email_validator/email_validator.dart';

class Validation {
  static String _valid = 'valid info';
  static String passwordError;
  static String emailError;

  static String validateEmailAndPassword(
    String email,
    String password,
  ) {
    bool validEmail = EmailValidator.validate(email);

    if (email.isEmpty) {
      return emailError = 'Email field is required';
    }
    if (password.isEmpty) {
      return passwordError = 'Password field is required';
    }
    if (password.length < 6) {
      return passwordError = 'Password must be more than 6 characters';
    }

    if (!validEmail) {
      return emailError = 'Please type valid email address';
    }

    return _valid;
  }

  static void resetErrorFields() {
    passwordError = null;
    emailError = null;
  }
}
