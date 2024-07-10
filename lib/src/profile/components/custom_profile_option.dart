import 'package:app/common_lib.dart';
import 'package:app/src/tabs/components/custom_botton_app_bar.dart';
import 'package:flutter/material.dart';

class CustomProfileOption extends StatelessWidget {
  CustomProfileOption(
      {super.key,
      required this.title,
      required this.icon,
      this.color,
      required this.onPressed});

  final String title;
  final String icon;
  Color? color;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderSize.smallRadius,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.small),
        child: Row(
          children: [
            GradientIcon(
              icon: icon,
            ),
            const Gap(Insets.small),
            Text(
              title,
              style: const TextStyle(fontWeight: FontsTheme.mediumBigWeight),
            ),
          ],
        ),
      ),
    );
  }
}
