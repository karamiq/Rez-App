import 'package:flutter/material.dart';

import '../../common_lib.dart';

class TextFieldHeadline extends StatelessWidget {
  const TextFieldHeadline({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.small),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontsTheme.mediumBigWeight,
          color: ColorsTheme.cyan,
          fontSize: FontsTheme.mediumSize,
        ),
      ),
    );
  }
}
