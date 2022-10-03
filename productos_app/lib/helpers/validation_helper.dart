class ValidationHelper {

  static String? isEmail(String? value, String message) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp  = RegExp(pattern);

    return regExp.hasMatch(value ?? '') 
      ? null
      : message;
  }

  static String? isValidPassword(String? value, String message) {

    if (value != null && value.length >= 6) return null;

    return message;
  }
}