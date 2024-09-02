class Validators {
  static String? validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains('@') || !value.contains('.')) {
      return 'Please enter a viable email addresss';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.length < 8 ||
        !value.contains(RegExp(r"[a-z]")) ||
        !value.contains(RegExp(r"[A-Z]")) ||
        (!value.contains(RegExp(r"[0-9]"))) ||
        !value.contains(RegExp(r"[0-9]")) ||
        !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Requirements not satisfied';
    }
    return null;
  }
}
