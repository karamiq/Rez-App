import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FadingGardientDivider extends StatelessWidget {
  const FadingGardientDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            ColorsTheme.primary,
            ColorsTheme.primary,
            Colors.transparent
          ],
          stops: [0.0, 0.4, 0.6, 1.0],
        ),
      ),
    );
  }
}
