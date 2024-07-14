import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

class CustomISvgStyle extends StatelessWidget {
  CustomISvgStyle({
    super.key,
    required this.icon,
    this.size = 22,
    this.color,
  });

  final String icon;
  final double size;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Insets.smallAll + Insets.extraSmallAll / 2,
      decoration: BoxDecoration(
        borderRadius: BorderSize.mediumRadius,
        color: color != null
            ? color!.withOpacity(0.3)
            : ColorsTheme.primary.withOpacity(.07),
      ),
      child: SvgPicture.asset(
        height: size,
        icon,
        color: color ?? ColorsTheme.primary,
      ),
    );
  }
}
