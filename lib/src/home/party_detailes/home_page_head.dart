import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../data/providers/location.dart';
import '../../tabs/components/custom_botton_app_bar.dart';

class HomePageHead extends ConsumerWidget {
  const HomePageHead({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: IconButton(
            onPressed: () async {
              ref.watch(locationProvider.notifier).getCurrentLocation();
            },
            icon: SvgPicture.asset(
              Assets.assetsSvgNotification,
            ),
          ),
        ),
        Expanded(
            flex: 20,
            child: GestureDetector(
              onTap: () async {
                await ref.watch(locationProvider.notifier).getCurrentLocation();

                context.pushNamed(RoutesDocument.googleMaps);
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: Insets.small),
                decoration: const BoxDecoration(
                    borderRadius: BorderSize.extraLargeRadius,
                    color: Color.fromARGB(30, 214, 125, 255)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Assets.assetsSvgSearchNormal),
                    const Gap(Insets.small),
                    const Text(
                      'Search',
                      style: TextStyle(
                          color: Color(0xFF472456),
                          fontSize: FontsTheme.mediumSize),
                    )
                  ],
                ),
              ),
            )),
        Expanded(
          flex: 3,
          child: IconButton(
            onPressed: () => context.pushNamed(RoutesDocument.calender),
            icon: GradientIcon(
              icon: Assets.assetsSvgCalendarOutlined,
            ),
          ),
        ),
      ],
    );
  }
}
