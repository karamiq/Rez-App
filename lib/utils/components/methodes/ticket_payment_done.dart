import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../src/tabs/components/custom_botton_app_bar.dart';
import '../buttons/gardient_border_button.dart';

Future<dynamic> ticketPaymentDone(BuildContext context) {
  return showDialog(
    barrierColor: Colors.black.withOpacity(.7),
    context: context,
    barrierDismissible:
        false, // This makes the dialog not dismissible when tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GradientIcon(
                icon: Assets.assetsSvgTicketStar,
              ),
              const Gap(Insets.extraLarge * 1.5),
              GradientBorderButton(
                  onPressed: () => context.goNamed(RoutesDocument.tabs),
                  text: "back to home")
            ],
          ));
    },
  );
}
