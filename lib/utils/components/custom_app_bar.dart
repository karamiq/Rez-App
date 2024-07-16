import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'buttons/gardient_button.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {super.key,
      required this.title,
      this.showBackButton = true,
      this.showCalender = true,
      this.gradientColor = GradientColor.green,
      this.onBackPressed,
      this.onRightIconPressed});
  void Function()? onRightIconPressed;
  void Function()? onBackPressed;
  GradientColor gradientColor;
  final String title;
  final bool showCalender;
  final bool showBackButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showBackButton)
              GradientBackButton(
                  gradientColor: gradientColor,
                  onPressed: onBackPressed ?? () => context.pop()),
            if (!showBackButton)
              const SizedBox(
                height: 40,
                width: 40,
              ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: FontsTheme.mediumBigSize,
                fontWeight: FontsTheme.mediumBigWeight,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            if (showCalender)
              GradientBackButton(
                  icon: Assets.assetsSvgCalendarOutlined,
                  onPressed: () => context.pushNamed(RoutesDocument.calender)),
            if (!showCalender)
              const SizedBox(
                height: 40,
                width: 40,
              )
          ],
        ),
        const Gap(Insets.extraLarge)
      ],
    );
  }
}
