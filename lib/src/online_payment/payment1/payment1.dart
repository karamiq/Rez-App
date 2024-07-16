import 'package:app/common_lib.dart';
import 'package:app/src/buying/buying3/components/payment_option.dart';
import 'package:app/utils/components/payment_head.dart';
import 'package:flutter/material.dart';

import '../../../utils/components/buttons/gardient_border_button.dart';

class Payment1Page extends StatelessWidget {
  const Payment1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const OnlinePaymentHead(
            title: 'Choose Payment Method',
            imageUrl:
                'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
          ),
          const Gap(Insets.extraLarge),
          Padding(
            padding: Insets.mediumAll,
            child: Column(
              children: [
                PaymentOption(
                  raduisBottom: true,
                  image: Assets.assetsImagesPaypal,
                  text: 'Haider Saddon',
                  onTap: () {},
                ),
                const Gap(Insets.small),
                PaymentOption(
                  raduisBottom: true,
                  image: Assets.assetsImagesQi,
                  text: 'Abbass',
                  onTap: () {},
                ),
                const Gap(Insets.medium),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: ColorsTheme,
                        foregroundColor: ColorsTheme.subtitle,
                        minimumSize: const Size(double.infinity, 70)),
                    onPressed: () => context.pushNamed(RoutesDocument.payment2),
                    child: const Text(
                      'Add Card',
                      style: TextStyle(fontSize: FontsTheme.mediumBigSize),
                    )),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: Insets.mediumAll,
            child: Column(
              children: [
                const Gap(Insets.extraLarge),
                GradientBorderButton(onPressed: () {}, text: 'Confirm payment'),
                const Gap(Insets.extraLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
