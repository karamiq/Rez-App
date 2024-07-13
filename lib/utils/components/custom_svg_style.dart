import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

class CustomISvgStyle extends StatelessWidget {
  CustomISvgStyle({
    super.key,
    required this.icon,
    this.color,
  });

  final String icon;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Insets.smallAll + Insets.extraSmallAll / 2,
      decoration: BoxDecoration(
        borderRadius: BorderSize.mediumRadius,
        color: color != null
            ? color!.withOpacity(0.2)
            : ColorsTheme.primary.withOpacity(.07),
      ),
      child: SvgPicture.asset(
        icon,
        color: color != null ? color : ColorsTheme.primary,
      ),
    );
  }
}
