import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class GradientBorderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const GradientBorderButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 40, 52, 181),
            Color.fromARGB(144, 23, 40, 189),
            Color.fromARGB(255, 130, 68, 222),
            Color.fromARGB(255, 232, 107, 253),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
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
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0), // Border width
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
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
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
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
                fontSize: CustomFontsTheme.mediumBigSize,
                fontWeight: CustomFontsTheme.mediumBigWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
