import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/assets.dart';
import '../constants/sizes.dart';
import 'buttons/gardient_button.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {super.key,
      required this.title,
      this.showCalender = true,
      this.onLeftIconPressed,
      this.onRightIconPressed});
  void Function()? onRightIconPressed;
  void Function()? onLeftIconPressed;
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
            GradientAppBarButton(
                icon: Assets.assetsSvgArrowLeft,
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
              GradientAppBarButton(
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
