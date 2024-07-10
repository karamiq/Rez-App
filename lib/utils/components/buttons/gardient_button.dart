import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

enum GradientColor {
  green,
  pink,
}

class GradientBackButton extends StatelessWidget {
  final String icon;
  final double backGroundOpacity;
  final VoidCallback? onPressed;
  final GradientColor gradientColor;

  const GradientBackButton({
    super.key,
    this.onPressed,
    this.icon = Assets.assetsSvgArrowLeft,
    this.backGroundOpacity = 1,
    this.gradientColor = GradientColor.green,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: gradientColor == GradientColor.green
              ? const [
                  Color(0xFF09FBD3),
                  Color(0xFF09FBD3),
                  Colors.transparent,
                ]
              : const [
                  Color(0xFFE85EFF),
                  Color(0xFFE85EFF),
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
            onPressed: onPressed ?? () => context.pop(),
          ),
        ),
      ),
    );
  }
}
