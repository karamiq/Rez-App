import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'buttons/gardient_button.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {super.key,
      required this.title,
      this.showCalender = true,
      this.gradientColor = GradientColor.green,
      this.onLeftIconPressed,
      this.onRightIconPressed});
  void Function()? onRightIconPressed;
  void Function()? onLeftIconPressed;
  GradientColor gradientColor;
  final String title;
  final bool showCalender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GradientBackButton(
                gradientColor: gradientColor,
                onPressed: onLeftIconPressed ?? () => context.pop()),
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
