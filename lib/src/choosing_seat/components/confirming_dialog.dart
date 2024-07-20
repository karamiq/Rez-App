import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../utils/components/buttons/gardient_border_button.dart';
import '../../../utils/components/seats/models.dart';
import '../../buying/buying2/components/ticket_card.dart';
import 'head_dialog.dart';

dynamic confrimingDialog(context, List<Seat> seat) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: Insets.mediumAll,
      child: Container(
        width: double.infinity,
        padding: Insets.mediumAll,
        child: ColumnPadded(
          gap: Insets.extraLarge,
          mainAxisSize: MainAxisSize.min,
          children: [
            const DialogHead(),
            Container(
              alignment: Alignment.center,
              padding: Insets.smallAll,
              decoration: const BoxDecoration(
                  color: ColorsTheme.ticketingListTileBackground,
                  borderRadius: BorderSize.mediumRadius),
              child: ColumnPadded(
                mainAxisSize: MainAxisSize.min,
                gap: Insets.medium,
                children: [
                  const Text(
                    'A4',
                    style: TextStyle(
                        fontWeight: FontsTheme.bigWeight,
                        fontSize: FontsTheme.mediumBigSize),
                  ),
                  SvgPicture.asset(Assets.assetsSvgSeatmap),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: Center(
                child: ListView.builder(
                    itemCount: seat.length,
                    itemBuilder: (context, index) {
                      return TicketCard(
                          title: 'Section P, Row ${seat[index].row}',
                          subtitle: '12 Seats available',
                          price: '€30',
                          priceDescription: 'per person');
                    }),
              ),
            ),
            GradientBorderButton(
                onPressed: () {
                  context.pushNamed(RoutesDocument.choosingSeat2, extra: seat);
                },
                text: 'Confirm')
          ],
        ),
      ),
    ),
  );
}
