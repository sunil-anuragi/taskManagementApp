import 'email_validator.dart';

class Validators {
  /// Check if first name is valid or not.
  bool isValidFirstName(String? input, {int maxLength = 20, RegExp? regExp}) {
    return ((regExp ?? RegExp("^[A-Za-z]+\$")).hasMatch(input ?? '') &&
        (input?.length ?? 0) <= maxLength);
  }

  /// Check if last name is valid or not
  bool isValidLastName(String? input, {int maxLength = 20, RegExp? regExp}) {
    return isValidFirstName(input, maxLength: maxLength, regExp: regExp);
  }

  /// Check if email is valid or not
  bool isValidEmail(String? input) {
    return EmailValidator.validate(input ?? '');
  }

  String? emailValidator(String? input) {
    if (input == null || input.isEmpty) {
      return 'Email is required';
    }
    return Validators().isValidEmail(input) ? null : 'Enter a valid email';
  }

  /// Check if password is valid or not
  bool isValidPassword(String? input, {RegExp? regExp, int maxLength = 24}) {
    return ((regExp ??
                RegExp(
                    '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$'))
            .hasMatch(input ?? '') &&
        (input?.length ?? 0) <= maxLength);
  }

  /// Check if confirm password matches main password
  bool isValidConfirmPassword(
      {required String? password, required String? confirmPassword}) {
    return password == confirmPassword;
  }

  bool isValidateMessage(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  /// Check if field is empty
  bool isValidateField(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return true;
  }
}
