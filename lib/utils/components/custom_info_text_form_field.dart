import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class CustomInfoTextFormField extends StatelessWidget {
  const CustomInfoTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.label = null,
  });

  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
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
          borderSide:
              BorderSide(color: Color.fromARGB(135, 244, 67, 54), width: 2),
          borderRadius: BorderSize.mediumRadius,
        ),
      ),
    );
  }
}
