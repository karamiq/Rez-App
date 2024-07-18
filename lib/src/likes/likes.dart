import 'package:app/src/tabs/components/custom_botton_app_bar.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../common_lib.dart';
import '../home/components/party_card.dart';

List<Party> list = [
  Party(
    imageUrl:
        'https://images.pexels.com/photos/4194850/pexels-photo-4194850.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    title: 'Party 1',
    genre: 'Electronic',
    ticketInfo: 'VIP Ticket',
    isExpired: false,
    expiredDate: DateTime(2024, 8, 1),
  ),
  Party(
    imageUrl:
        'https://images.pexels.com/photos/735423/pexels-photo-735423.jpeg',
    title: 'Party 2',
    genre: 'Rock',
    ticketInfo: 'General Admission',
    isExpired: false,
    expiredDate: DateTime(2024, 7, 1),
  ),
  Party(
    imageUrl: 'https://via.placeholder.com/150',
    title: 'Party 3',
    genre: 'Jazz',
    ticketInfo: 'VIP Ticket',
    isExpired: false,
    expiredDate: DateTime(2024, 9, 1),
  ),
  Party(
    imageUrl: 'https://via.placeholder.com/150',
    title: 'Party 4',
    genre: 'Hip-Hop',
    ticketInfo: 'Early Bird',
    isExpired: false,
    expiredDate: DateTime(2024, 6, 1),
  ),
  Party(
    imageUrl: 'https://via.placeholder.com/150',
    title: 'Party 5',
    genre: 'Classical',
    ticketInfo: 'General Admission',
    isExpired: false,
    expiredDate: DateTime(2024, 10, 1),
  ),
  Party(
    imageUrl: 'https://via.placeholder.com/150',
    title: 'Party 6',
    genre: 'Pop',
    ticketInfo: 'VIP Ticket',
    isExpired: false,
    expiredDate: DateTime(2024, 5, 1),
  ),
  Party(
    imageUrl: 'https://via.placeholder.com/150',
    title: 'Party 7',
    genre: 'Reggae',
    ticketInfo: 'Early Bird',
    isExpired: false,
    expiredDate: DateTime(2024, 11, 1),
  ),
];

class LikesPage extends StatelessWidget {
  const LikesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List likedParties = [''];
    return CustomScaffold(
      padding: Insets.mediumAll,
      body: likedParties.isNotEmpty
          ? ListView.separated(
              itemBuilder: (context, index) {
                final party = list[index];
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
              itemCount: list.length,
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientIcon(
                    icon: Assets.assetsSvgHeartSlash,
                    size: 250,
                  ),
                  Gap(Insets.large),
                  const Text(
                    'No tickets bought',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontsTheme.bigWeight,
                      fontSize: FontsTheme.bigSize,
                    ),
                  ),
                  const Text(
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

class Party {
  final String imageUrl;
  final String title;
  final String genre;
  final String ticketInfo;
  final bool isExpired;
  final DateTime expiredDate;

  Party({
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.ticketInfo,
    required this.isExpired,
    required this.expiredDate,
  });
}
