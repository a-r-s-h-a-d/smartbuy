final RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$');
final RegExp phoneRegex =
    RegExp(r'^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$');

bool validateName(String name) {
  if (name.isEmpty) {
    return false;
  }
  return nameRegExp.hasMatch(name);
}
