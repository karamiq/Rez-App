import 'package:app/common_lib.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/custom_svg_style.dart';
import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'components/buying_head_1.dart';

class Buying1stPage extends StatelessWidget {
  const Buying1stPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BuyingHead1(
              appBarTitle: 'name',
              imageUrl:
                  'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
              title: 'Jazz Night',
              subTitle: 'with Ali Jasseb',
              description:
                  'A pretty night with calm and relax jazz A pretty night with calm and relax jazz A pretty night with calm and relax jazz',
            ),
            const Gap(Insets.medium),
            Padding(
              padding: Insets.mediumAll,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomISvgStyle(
                            icon: Assets.assetsSvgCalendarOutlined,
                          ),
                          const Gap(Insets.small),
                          const Text('Al-Yarmook Club'),
                        ],
                      ),
                      Row(
                        children: [
                          CustomISvgStyle(
                            icon: Assets.assetsSvgCalendarOutlined,
                          ),
                          const Gap(Insets.small),
                          const Text('2024/2/4'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
