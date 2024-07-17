String? validateCreditCard(String? value) {
  RegExp creditCardRegex = RegExp(r'^\d{4}\s?\d{4}\s?\d{4}\s?\d{4}$');
  if (value == null || value.isEmpty) {
    return 'Please enter a credit card number';
  }
  if (!creditCardRegex.hasMatch(value)) {
    return 'Enter a valid credit card number';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  RegExp phoneNumberRegex = RegExp(r'^\(\d{3}\) \d{3}\-\d{4}$');
  if (value == null || value.isEmpty) {
    return 'Please enter a phone number';
  }
  if (!phoneNumberRegex.hasMatch(value)) {
    return 'Enter a valid phone number (e.g., (123) 456-7890)';
  }
  return null;
}

String? validateGeneralInfo(String? value) {
  if (value == null || value.isEmpty) {
    return 'Field is required';
  }
  if (value.length < 3) {
    return 'should be at least 3 characters long';
  }
  return null;
}
