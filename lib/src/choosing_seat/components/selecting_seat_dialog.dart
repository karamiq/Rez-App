import 'package:flutter/material.dart';
import '../../../common_lib.dart';
import '../../../utils/components/buttons/gardient_border_button.dart';
import '../../../utils/components/seats/models.dart';
import '../../../utils/components/seats/seats_table.dart';
import '../../../utils/components/text_field_head_line.dart';
import 'confirming_dialog.dart';
import 'head_dialog.dart';

dynamic selectSeatDialog(BuildContext context) {
  List<Seat> selectedSeats = [];
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: Insets.extraSmallAll,
      child: Container(
        width: double.infinity,
        padding: Insets.mediumAll,
        child: ColumnPadded(
          gap: Insets.medium,
          mainAxisSize: MainAxisSize.min,
          children: [
            const DialogHead(),
            Container(
              alignment: Alignment.center,
              padding: Insets.smallAll,
              decoration: const BoxDecoration(
                  color: ColorsTheme.ticketingListTileBackground,
                  borderRadius: BorderSize.mediumRadius),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'A4',
                    style: TextStyle(
                        fontWeight: FontsTheme.bigWeight,
                        fontSize: FontsTheme.mediumBigSize),
                  ),
                  SeatsTable(
                      unSeatColor: ColorsTheme.darkEmptySeat,
                      selectedSeatColor: ColorsTheme.bookingSeat,
                      bookedSeats: selectedSeats,
                      seats: const [
                        SeatsRow(statuses: [
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.booked,
                        ]),
                        SeatsRow(statuses: [
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                        ]),
                        SeatsRow(statuses: [
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                        ]),
                        SeatsRow(statuses: [
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                        ]),
                        SeatsRow(statuses: [
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                        ]),
                        SeatsRow(statuses: [
                          SeatStatus.available,
                          SeatStatus.booked,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                        ]),
                        SeatsRow(statuses: [
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.available,
                          SeatStatus.booked,
                          SeatStatus.booked,
                          SeatStatus.available,
                        ]),
                      ]),
                ],
              ),
            ),
            const Gap(Insets.medium),
            GradientBorderButton(
                onPressed: () {
                  if (selectedSeats.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title:
                            const TextFieldHeadline(text: 'No Seat Selected'),
                        content: const Text(
                            'Please select at least one seat to proceed.'),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: ColorsTheme.cyan),
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'OK',
                            ),
                          ),
                        ],
                      ),
                    );
                    return;
                  }
                  confrimingDialog(context, selectedSeats);
                },
                text: 'Next'),
          ],
        ),
      ),
    ),
  );
}
