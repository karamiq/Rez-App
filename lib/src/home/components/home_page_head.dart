import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../tabs/components/custom_botton_app_bar.dart';

class HomePageHead extends StatelessWidget {
  const HomePageHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: GradientIcon(icon: Assets.assetsSvgNotification)),
        Expanded(
          child: GestureDetector(
            onTap: () => context.pushNamed(RoutesDocument.searchMaps),
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
              decoration: const BoxDecoration(
                  borderRadius: BorderSize.extraLargeRadius,
                  color: Color.fromARGB(38, 214, 125, 255)),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.assetsSvgSearchNormal),
                  const Gap(Insets.small),
                  const Text(
                    'Search',
                    style: TextStyle(color: Color(0xFF472456)),
                  )
                ],
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () => context.pushNamed(RoutesDocument.calender),
            icon: GradientIcon(icon: Assets.assetsSvgCalendarOutlined)),
      ],
    );
  }
}
