import 'package:app/common_lib.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:flutter/material.dart';

class PaymentOption extends StatelessWidget {
  final String icon;
  final String image;
  final String text;
  final VoidCallback? onTap;
  final bool raduisBottom;

  const PaymentOption(
      {super.key,
      this.icon = '',
      this.image = '',
      required this.text,
      this.onTap,
      required this.raduisBottom});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Insets.extraSmallAll,
        decoration: BoxDecoration(
          color: ColorsTheme.lightPrimary,
          borderRadius: raduisBottom
              ? BorderSize.smallRadius
              : const BorderRadius.vertical(
                  top: Radius.circular(BorderSize.small),
                ),
        ),
        child: Padding(
          padding: Insets.extraSmallAll,
          child: ListTile(
            title: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontsTheme.mediumBigWeight,
              ),
            ),
            leading: image.isEmpty
                ? CustomISvgStyle(
                    color: ColorsTheme.primary,
                    size: IconSize.medium,
                    icon: icon,
                  )
                : Image.asset(
                    image,
                    height: 40,
                    width: 40,
                  ),
          ),
        ),
      ),
    );
  }
}
