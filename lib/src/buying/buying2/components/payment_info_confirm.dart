import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common_lib.dart';
import '../../../../utils/components/gardient/fading_divider.dart';

class PaymentInfoConfirm extends StatelessWidget {
  final double perPerson;
  final double seatPrice;
  final double fees;
  final double total;

  const PaymentInfoConfirm({
    super.key,
    required this.perPerson,
    required this.seatPrice,
    required this.fees,
    required this.total,
  });

  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(symbol: '', decimalDigits: 0);
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FadingGardientDivider(),
        const Gap(Insets.extraLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'per person',
              style: TextStyle(
                  fontWeight: FontsTheme.mediumBigWeight,
                  color: ColorsTheme.ticketingListTileSubtitle,
                  fontSize: FontsTheme.mediumSize),
            ),
            Text(
              formatCurrency(perPerson),
              style: const TextStyle(
                  fontWeight: FontsTheme.mediumBigWeight,
                  color: Colors.white,
                  fontSize: FontsTheme.mediumSize),
            )
          ],
        ),
        const Gap(Insets.medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Seat price',
              style: TextStyle(
                  fontWeight: FontsTheme.mediumBigWeight,
                  color: ColorsTheme.ticketingListTileSubtitle,
                  fontSize: FontsTheme.mediumSize),
            ),
            Text(
              formatCurrency(seatPrice),
              style: const TextStyle(
                  fontWeight: FontsTheme.mediumBigWeight,
                  color: Colors.white,
                  fontSize: FontsTheme.mediumSize),
            )
          ],
        ),
        const Gap(Insets.medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Fees',
              style: TextStyle(
                  fontWeight: FontsTheme.mediumBigWeight,
                  color: ColorsTheme.ticketingListTileSubtitle,
                  fontSize: FontsTheme.mediumSize),
            ),
            Text(
              formatCurrency(fees),
              style: const TextStyle(
                  fontWeight: FontsTheme.mediumBigWeight,
                  color: Colors.white,
                  fontSize: FontsTheme.mediumSize),
            )
          ],
        ),
        const Gap(Insets.extraLarge),
        const FadingGardientDivider(),
        const Gap(Insets.extraLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                  fontWeight: FontsTheme.mediumBigWeight,
                  color: ColorsTheme.ticketingListTileSubtitle,
                  fontSize: FontsTheme.mediumSize),
            ),
            Text(
              formatCurrency(total),
              style: const TextStyle(
                  fontWeight: FontsTheme.mediumBigWeight,
                  color: Colors.white,
                  fontSize: FontsTheme.mediumSize),
            )
          ],
        ),
      ],
    );
  }
}
