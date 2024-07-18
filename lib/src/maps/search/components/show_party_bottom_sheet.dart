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
                        'https://s3-alpha-sig.figma.com/img/5af1/98e3/f270cd486976bd3900e567c283a931e7?Expires=1722211200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=meUKdEkXHUtvqG-rZTKSHGvFAXhJRJIjqtIBhawq9~NJcDCDbRAAInIycfJ3t-NQagcVTBfMAOHsRFyNMRjni23GVYlgq6LevG8bh~fv4e3j4SY1q3mKwLzQaG6aquiqZ3vvNJKMR5Ssh4LABPXycWHmxCLz4st6yzhGwhcIRreW29litpVre2RR6wHNGr~oTBuGXWNyKt8Ci-DeyVFWGOxFlV7IzDtUANoLYSCuFtN4J5ArSS2R~CxatRAI1czereqKgycDBbiMd85L0ohHg3DCIn5TcaFIeyjiwuiUjzRG9WT1KqC7ZRh9b1nO1k-zqXXvnbCFp2WtndQmVgrOaw__',
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
