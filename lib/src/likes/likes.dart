import 'package:app/src/tabs/components/custom_botton_app_bar.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../common_lib.dart';
import '../home/components/party_card.dart';
import '../maps/search/components/search_head.dart';

class LikesPage extends StatelessWidget {
  const LikesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List likedParties = [];
    return CustomScaffold(
      padding: Insets.mediumAll,
      body: likedParties.isNotEmpty
          ? ListView.separated(
              itemBuilder: (context, index) {
                final party = searchparties[index];
                return PartyCard(
                  type: 'ticket',
                  imageUrl: party.imageUrl,
                  title: party.title,
                  genre: party.genre,
                  ticketInfo: party.ticketInfo,
                  isExpired: party.isExpired,
                  expiredDate: party.expiredDate,
                );
              },
              separatorBuilder: (context, index) => const Gap(Insets.medium),
              itemCount: 0,
            )
          : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientIcon(
                    icon: Assets.assetsSvgHeartSlash,
                    size: 250,
                  ),
                  Gap(Insets.large),
                  Text(
                    'No tickets bought',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontsTheme.bigWeight,
                      fontSize: FontsTheme.bigSize,
                    ),
                  ),
                  Text(
                    'Please add some liked ticket to have this feature we hope you will enjoy the app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsTheme.subtitle,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
