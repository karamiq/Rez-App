import 'package:flutter/material.dart';

import '../../../../common_lib.dart';
import '../../../../utils/components/buttons/gardient_border_button.dart';
import '../../../home/components/party_card.dart';

Future<dynamic> showPartyModalBottomSheet(context) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) => SafeArea(
      child: Padding(
        padding: Insets.mediumAll,
        child: ColumnPadded(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Insets.medium, horizontal: Insets.extraLarge),
                child: PartyCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1605034949929-6af5f19593b3?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    title: 'title',
                    genre: 'genre',
                    ticketInfo: 'ticketInfo',
                    isExpired: false,
                    expiredDate: DateTime.now(),
                    type: 'staduim'),
              ),
            ),
            GradientBorderButton(onPressed: () {}, text: 'Get Directions')
          ],
        ),
      ),
    ),
  );
}
