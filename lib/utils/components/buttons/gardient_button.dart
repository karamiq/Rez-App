import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GradientAppBarButton extends StatelessWidget {
  final String icon;
  final double backGroundOpacity;
  final VoidCallback? onPressed;

  const GradientAppBarButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.backGroundOpacity = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF09FBD3),
            Color(0xFF09FBD3),
            Colors.transparent,
          ],
        ),
      ),
      child: Center(
        child: Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF51566d).withOpacity(backGroundOpacity),
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              icon,
              height: 20,
            ),
            color: Colors.white,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
