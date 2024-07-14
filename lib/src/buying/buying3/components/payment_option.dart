import 'package:app/common_lib.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:flutter/material.dart';

class PaymentOption extends StatelessWidget {
  final String icon;
  final String image;
  final String text;
  final VoidCallback? onTap;
  const PaymentOption({
    super.key,
    this.icon = '',
    this.image = '',
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsTheme.lightPrimary,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderSize.smallRadius,
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
                    )),
        ),
      ),
    );
  }
}
