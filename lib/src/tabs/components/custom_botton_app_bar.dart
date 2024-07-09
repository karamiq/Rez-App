import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/sizes.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
    required this.selectedPageIndex,
    required this.selectedPage,
  });

  final int selectedPageIndex;
  final void Function(int)? selectedPage;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      currentIndex: selectedPageIndex,
      onTap: selectedPage,
      selectedLabelStyle: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: FontsTheme.verySmallSize),
      selectedItemColor: const Color(0xFFE85EFF),
      items: <BottomNavigationBarItem>[
        customBottomAppBarItem(
          context: context,
          label: 'HomePage',
          icon: Assets.assetsSvgHome,
        ),
        customBottomAppBarItem(
          icon: Assets.assetsSvgTicketExpired,
          label: 'Tickt',
          context: context,
        ),
        customBottomAppBarItem(
          icon: Assets.assetsSvgHeart,
          label: 'Likes',
          context: context,
        ),
        customBottomAppBarItem(
          icon: Assets.assetsSvgProfile,
          label: 'Profile',
          context: context,
        ),
      ],
    );
  }

  BottomNavigationBarItem customBottomAppBarItem({
    required String icon,
    required String label,
    required BuildContext context,
  }) {
    return BottomNavigationBarItem(
      activeIcon: GradientSvg(
        svgAsset: icon,
        size: 24,
        gradient: ColorsTheme.linearGradient,
      ),
      icon: SvgPicture.asset(
        icon,
        color: Theme.of(context).hintColor.withAlpha(100),
        width: 24,
        height: 24,
      ),
      label: label,
    );
  }
}

class GradientSvg extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Gradient gradient;

  GradientSvg({
    super.key,
    required this.svgAsset,
    required this.size,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: SvgPicture.asset(
        svgAsset,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText({
    super.key,
    required this.text,
    required this.style,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
