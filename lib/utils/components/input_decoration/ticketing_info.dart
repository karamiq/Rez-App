import 'package:flutter/material.dart';

import '../../../common_lib.dart';

InputDecoration ticketingInfoDecoration(
    {required String labelText, Widget? label}) {
  return InputDecoration(
    contentPadding: Insets.mediumAll,
    helperText: '',
    hintText: labelText,
    label: label,
    hintStyle: const TextStyle(color: ColorsTheme.ticketingLabel),
    filled: true,
    fillColor: ColorsTheme.tickitingTextField,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderSize.smallRadius,
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderSize.smallRadius,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderSize.smallRadius,
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(135, 244, 67, 54), width: 2),
      borderRadius: BorderSize.smallRadius,
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(135, 244, 67, 54), width: 1),
      borderRadius: BorderSize.smallRadius,
    ),
  );
}
