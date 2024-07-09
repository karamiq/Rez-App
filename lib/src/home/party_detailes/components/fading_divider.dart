import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FadingDivider extends StatelessWidget {
  const FadingDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, ColorsTheme.primary, Colors.transparent],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
