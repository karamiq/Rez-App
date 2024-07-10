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
      activeIcon: GradientIcon(
        icon: icon,
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

class GradientIcon extends StatelessWidget {
  final dynamic icon;

  const GradientIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (icon is IconData) {
      return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => ColorsTheme.linearGradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Icon(
          size: IconSize.large,
          icon,
        ),
      );
    }
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => ColorsTheme.linearGradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: SvgPicture.asset(
        icon,
        fit: BoxFit.contain,
      ),
    );
  }
}
