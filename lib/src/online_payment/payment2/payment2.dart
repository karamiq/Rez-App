import 'package:app/common_lib.dart';
import 'package:app/src/buying/buying3/components/payment_option.dart';
import 'package:app/utils/components/payment_head.dart';
import 'package:flutter/material.dart';
import '../../../utils/components/buttons/gardient_border_button.dart';

class Payment2Page extends StatelessWidget {
  const Payment2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const OnlinePaymentHead(
            title: 'Online Payment',
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
                  text: 'Paypal',
                  onTap: () {},
                ),
                const Gap(Insets.small),
                PaymentOption(
                  raduisBottom: true,
                  image: Assets.assetsImagesQi,
                  text: 'Qi Card',
                  onTap: () => context.pushNamed(RoutesDocument.payment3),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: Insets.mediumAll,
            child: Column(
              children: [
                const Gap(Insets.extraLarge),
                GradientBorderButton(onPressed: () {}, text: 'Next'),
                const Gap(Insets.extraLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
