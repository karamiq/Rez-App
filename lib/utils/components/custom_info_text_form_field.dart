import 'package:flutter/material.dart';

import '../constants/sizes.dart';
import 'input_decoration/add_card_decoration.dart';

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
      decoration: addCardDecoration(labelText, label),
    );
  }
}
