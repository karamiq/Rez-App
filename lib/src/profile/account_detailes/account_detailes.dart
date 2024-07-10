import 'package:app/common_lib.dart';
import 'package:app/src/tabs/components/custom_botton_app_bar.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/custom_list_tile.dart';
import 'components/user_card.dart';

class AccountDetailesPage extends StatelessWidget {
  const AccountDetailesPage({super.key});
  void onTap() {}
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: Insets.mediumAll,
      body: Column(
        children: [
          CustomAppBar(title: 'ffff'),
          const UserCard(
            cardNumber: '**** **** **** 9831',
            cardHolder: 'Haider Sadoon',
            expiryDate: '03/27',
          ),
          const Gap(Insets.medium),
          CustomListTile(
            title: 'GoPAY',
            subtitle: '0854 5632 1752',
            imagePath: Assets.assetsImagesWallet,
            onTap: () {},
          ),
          CustomListTile(
            title: 'DANA',
            subtitle: '0854 5632 1752',
            imagePath: Assets.assetsImagesFlag,
            onTap: () {},
          ),
          CustomListTile(
            title: 'DANA',
            subtitle: '0854 5632 1752',
            imagePath: Assets.assetsImagesLogoShopeePay,
            onTap: () {},
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: ColorsTheme.hint), //
                foregroundColor: ColorsTheme.hint,
                surfaceTintColor: ColorsTheme.hint,
                minimumSize: const Size(double.infinity, 60),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderSize.extraLargeRadius)),
            child: const Text(
              'Add Card',
              style: TextStyle(
                  fontSize: FontsTheme.mediumSize, color: ColorsTheme.hint),
            ),
          )
        ],
      ),
    );
  }
}
