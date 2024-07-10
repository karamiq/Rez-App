import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../utils/components/gardient_text.dart';
import '../../../utils/constants/sizes.dart';
import '../../tabs/components/custom_botton_app_bar.dart';
import '../profile.dart';

class ProfileInfoRow extends StatelessWidget {
  final int followedArtists;
  final int bookmarkedConcerts;
  final int purchasedTickets;

  const ProfileInfoRow({
    super.key,
    required this.followedArtists,
    required this.bookmarkedConcerts,
    required this.purchasedTickets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.extraLargeAll,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Row(
                children: [
                  GradientText(
                    followedArtists.toString(),
                    gradient: ColorsTheme.linearGradient,
                    style: const TextStyle(
                      fontSize: FontsTheme.mediumBigSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(Insets.extraSmall),
                  GradientIcon(icon: Assets.assetsSvgUsers)
                ],
              ),
              const Text(
                'Followed\nArtist',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: FontsTheme.verySmallSize),
              )
            ],
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(
              color: ColorsTheme.divider,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  GradientText(
                    bookmarkedConcerts.toString(),
                    gradient: ColorsTheme.linearGradient,
                    style: const TextStyle(
                      fontSize: FontsTheme.mediumBigSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(Insets.extraSmall),
                  GradientIcon(icon: Assets.assetsSvgFavorites)
                ],
              ),
              const Text(
                'Bookmark\nConcert',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: FontsTheme.verySmallSize),
              )
            ],
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(
              color: ColorsTheme.divider,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  GradientText(
                    purchasedTickets.toString(),
                    gradient: ColorsTheme.linearGradient,
                    style: const TextStyle(
                      fontSize: FontsTheme.mediumBigSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(Insets.extraSmall),
                  GradientIcon(icon: Assets.assetsSvgTicketHorizantly)
                ],
              ),
              const Text(
                'Purchase\nTicket',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: FontsTheme.verySmallSize),
              )
            ],
          )
        ],
      ),
    );
  }
}
