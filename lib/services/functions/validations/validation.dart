final RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$');
final RegExp phoneRegex =
    RegExp(r'^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$');

bool validateName(String name) {
  if (name.isEmpty) {
    return false;
  }
  return nameRegExp.hasMatch(name);
}

String? validateDateOfBirth(String dob) {
  if (dob.isEmpty) {
    return 'Please enter your date of birth';
  }

  const datePattern = r'^\d{2}/\d{2}/\d{4}$';
  if (!RegExp(datePattern).hasMatch(dob)) {
    return 'Please enter a valid date of birth in DD/MM/YYYY format';
  }

  final dateTime = DateTime.tryParse(dob.split('/').reversed.join());
  if (dateTime == null) {
    return 'Please enter a valid date of birth';
  }

  final now = DateTime.now();
  final diff = now.difference(dateTime);
  if (diff.inDays < 0) {
    return 'Date of birth cannot be in the future';
  }

  // Return null if there are no validation errors
  return null;
}
