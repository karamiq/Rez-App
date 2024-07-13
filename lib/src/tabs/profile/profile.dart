import 'package:app/common_lib.dart';
import 'package:app/src/tabs/profile/components/custom_profile_option.dart';
import 'package:app/src/tabs/components/custom_botton_app_bar.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/pofile_info_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: Insets.largeAll,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              gradient: ColorsTheme.primaryLinearGradient,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  color: ColorsTheme.backGround, shape: BoxShape.circle),
              child: const CircleAvatar(
                radius: BorderSize.extraLarge,
                backgroundImage: NetworkImage(
                    'https://cdn.oneesports.gg/cdn-data/2023/04/Anime_DemonSlayer_Muzan_3.jpg'),
              ),
            ),
          ),
          const Gap(Insets.medium),
          const ProfileInfoRow(
            followedArtists: 11,
            bookmarkedConcerts: 4,
            purchasedTickets: 3,
          ),
          Card(
              color: ColorsTheme.primaryContainer,
              child: Column(
                children: [
                  const Gap(Insets.extraSmall),
                  CustomProfileOption(
                      title: 'Settings',
                      icon: Assets.assetsSvgCog,
                      onPressed: () {}),
                  const Divider(color: ColorsTheme.divider),
                  CustomProfileOption(
                      title: 'Account Details',
                      icon: Assets.assetsSvgUserCircle,
                      onPressed: () =>
                          context.pushNamed(RoutesDocument.accountDetailes)),
                  const Gap(Insets.extraSmall),
                ],
              )),
          Card(
              color: ColorsTheme.primaryContainer,
              child: Column(
                children: [
                  const Gap(Insets.extraSmall),
                  CustomProfileOption(
                      title: 'Ticket History',
                      icon: Assets.assetsSvgTicketExpired,
                      onPressed: () =>
                          context.pushNamed(RoutesDocument.ticketHistory)),
                  const Divider(color: ColorsTheme.divider),
                  CustomProfileOption(
                      title: 'Privacy and safety',
                      icon: Assets.assetsSvgShieldCheck,
                      onPressed: () {}),
                  CustomProfileOption(
                      title: 'Notifications',
                      icon: Assets.assetsSvgNotification,
                      onPressed: () {}),
                  const Gap(Insets.extraSmall),
                ],
              )),
          Card(
              color: ColorsTheme.primaryContainer,
              child: Column(
                children: [
                  const Gap(Insets.extraSmall),
                  CustomProfileOption(
                      title: 'Help and Services',
                      icon: Assets.assetsSvgChat,
                      onPressed: () {}),
                  const Divider(color: ColorsTheme.divider),
                  CustomProfileOption(
                      title: 'About',
                      icon: Assets.assetsSvgInformationCircle,
                      onPressed: () {}),
                  const Gap(Insets.extraSmall),
                ],
              )),
        ],
      ),
    );
  }
}
