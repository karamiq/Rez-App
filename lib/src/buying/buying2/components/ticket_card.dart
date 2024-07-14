import 'package:flutter/material.dart';

import '../../../../utils/components/gardient/custom_svg_style.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/sizes.dart';

class TicketCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String priceDescription;

  const TicketCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.priceDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsTheme.ticketingListTileBackground,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              fontSize: FontsTheme.normalSize,
              color: ColorsTheme.ticketingListTileTitle),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
              fontSize: FontsTheme.smallSize,
              color: ColorsTheme.ticketingListTileSubtitle),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              price,
              style: const TextStyle(
                  color: Colors.white, fontSize: FontsTheme.mediumSize),
            ),
            Text(
              priceDescription,
              style: const TextStyle(
                  color: ColorsTheme.ticketingListTileSubtitle,
                  fontSize: FontsTheme.smallSize),
            )
          ],
        ),
        leading: CustomISvgStyle(
          icon: Assets.assetsSvgTicket,
          color: const Color(0xFF4C32CC),
        ),
      ),
    );
  }
}
