import 'package:get/get.dart';

class Validators {
  static String? emailValidator(String? value) {
    if (!GetUtils.isEmail(value ?? "")) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter.';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit.';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }
    if (value != password) {
      return 'Passwords do not match.';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name.';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters long.';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number.';
    }
    if (value.length < 10) {
      return 'Phone number must be at least 10 characters long.';
    }

    if (value.length > 10) {
      return 'Phone number must be at most 10 characters long.';
    }

    return null;
  }

  static String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username.';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters long.';
    }
    return null;
  }
}
