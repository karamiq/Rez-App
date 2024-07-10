import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class GradientBorderButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final List<Color> borderColors;
  final List<Color> colors;
  final bool isShadow;

  const GradientBorderButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.borderColors = const [
        Color.fromARGB(255, 40, 52, 181),
        Color.fromARGB(144, 23, 40, 189),
        Color.fromARGB(255, 78, 77, 78),
        Color.fromARGB(255, 232, 107, 253)
      ],
      this.colors = const [
        Color(0xFF1D1E5F),
        Color(0xFF21226C),
        Color(0xFF2D2774),
        Color(0xFF3A2675),
        Color(0xFF452774),
        Color(0xFF552876),
        Color(0xFF5E2876),
        Color(0xFF5F2774),
        Color(0xFF481E5C),
      ],
      this.isShadow = true});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: borderColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(50),
        boxShadow: isShadow
            ? [
                BoxShadow(
                  blurRadius: 25,
                  spreadRadius: 0,
                  offset: const Offset(5, 0),
                  color: const Color(0xFFE85EFF).withOpacity(.7),
                ),
                BoxShadow(
                  blurRadius: 25,
                  spreadRadius: 0,
                  offset: const Offset(-10, 0),
                  color: const Color(0xFF1827BE).withOpacity(.7),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0), // Border width
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(500),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: FontsTheme.mediumBigSize,
                fontWeight: FontsTheme.mediumBigWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
