import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../maps/search/components/data_.dart';
import 'party_card.dart';

class AllTab extends StatelessWidget {
  const AllTab({super.key, required this.partyData});
  final List<Party> partyData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => PartyCard(
            imageUrl: partyData[index].imageUrl,
            title: partyData[index].title,
            genre: partyData[index].genre,
            ticketInfo: partyData[index].ticketInfo,
            isExpired: partyData[index].isExpired,
            expiredDate: partyData[index].expiredDate,
            type: index % 2 == 0 ? 'ticket' : 'stadium'),
        separatorBuilder: (context, index) => const Gap(Insets.medium),
        itemCount: partyData.length);
  }
}
