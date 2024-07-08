import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/assets.dart';

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
      items: <BottomNavigationBarItem>[
        customBottomAppBarItem(
            context: context, label: 'الرئيسية', icon: Assets.assetsSvgHome),
        customBottomAppBarItem(
          icon: Assets.assetsSvgTicketExpired,
          label: 'البطاقة',
          context: context,
        ),
        customBottomAppBarItem(
          icon: Assets.assetsSvgHeart,
          label: 'الخط',
          context: context,
        ),
        customBottomAppBarItem(
          icon: Assets.assetsSvgProfile,
          label: 'المركبات',
          context: context,
        ),
      ],
    );
  }

  BottomNavigationBarItem customBottomAppBarItem({
    required String icon,
    required label,
    required BuildContext context,
  }) {
    return BottomNavigationBarItem(
      activeIcon: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.red,
          Colors.green,
        ])),
        child: SvgPicture.asset(
          icon,
          color: Colors.white,
        ),
      ),
      icon: SvgPicture.asset(
        icon,
        color: Theme.of(context).hintColor.withAlpha(100),
      ),
      label: label,
    );
  }
}
