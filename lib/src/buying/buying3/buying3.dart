import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:flutter/material.dart';
import '../../../utils/components/custom_app_bar.dart';
import '../../../utils/components/payment_head.dart';
import 'components/payment_option.dart';

class Buying3ndPage extends StatelessWidget {
  const Buying3ndPage({
    super.key,
  });

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
          PaymentOption(
            icon: Assets.assetsSvgTruckTick,
            text: 'Delivery on Cash',
            onTap: () {},
          ),
          PaymentOption(
            icon: Assets.assetsSvgBuildings,
            text: 'Nears Cash Point',
            onTap: () {},
          ),
          PaymentOption(
              icon: Assets.assetsSvgCards,
              text: 'Credit Card',
              onTap: () => context.pushNamed(RoutesDocument.payment1)),
          const Spacer(),
          Padding(
            padding: Insets.mediumAll * 2,
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
