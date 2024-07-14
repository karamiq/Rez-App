import 'package:flutter/material.dart';

import '../../../common_lib.dart';

InputDecoration addCardDecoration(String labelText, Widget? label) {
  return InputDecoration(
    contentPadding: Insets.mediumAll,
    helperText: '',
    hintText: labelText,
    label: label,
    hintStyle: const TextStyle(color: ColorsTheme.onCard),
    filled: true,
    fillColor: const Color(0xFF151723),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderSize.mediumRadius,
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderSize.mediumRadius,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderSize.mediumRadius,
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(135, 244, 67, 54), width: 2),
      borderRadius: BorderSize.mediumRadius,
    ),
  );
}
