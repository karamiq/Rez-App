import 'package:app/src/maps/search/components/data_.dart';
import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../components/party_card.dart';

class AllTab extends StatelessWidget {
  const AllTab({
    super.key,
    required this.partyData,
  });

  final List<Party> partyData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: Insets.medium),
        itemBuilder: (context, index) => PartyCard(
              imageUrl: partyData[index].imageUrl,
              title: partyData[index].title,
              genre: partyData[index].genre,
              ticketInfo: partyData[index].ticketInfo,
              type: '',
              expiredDate: DateTime.now(),
              isExpired: false,
            ),
        itemCount: partyData.length);
  }
}
