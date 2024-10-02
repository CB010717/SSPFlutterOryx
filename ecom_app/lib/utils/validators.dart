class Validators {
  /// Validates an email address.
  /// 
  /// Returns an error message if the email is invalid, otherwise returns null.
  static String? validateEmail(String? value) {
    if (value == null || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  /// Validates a password.
  /// 
  /// Returns an error message if the password is less than 6 characters,
  /// otherwise returns null.
  static String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
