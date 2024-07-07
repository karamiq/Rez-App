import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/components/buttons/gardient_border_button.dart';
import '../../../utils/constants/sizes.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(Insets.extraLarge * 2),
        const Gap(Insets.extraLarge),
        Text(
          '+964 7728833423',
          style: TextStyle(
              fontWeight: CustomFontsTheme.mediumWeight,
              fontSize: CustomFontsTheme.bigSize,
              fontFamily: GoogleFonts.cairo().fontFamily),
        ),
        const Text(
          'Write the OTP have been sent to your phone number',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CustomFontsTheme.mediumSize,
          ),
        ),
        const Gap(Insets.extraLarge * 2),
        Pinput(
          length: 5,
          focusedPinTheme: PinTheme(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderSize.smallRadius,
              border: Border.all(),
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          errorPinTheme: PinTheme(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderSize.mediumRadius,
                border: Border.all(
                    width: .5, color: Theme.of(context).colorScheme.error),
                color: Theme.of(context).colorScheme.onInverseSurface,
              )),
          defaultPinTheme: PinTheme(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderSize.smallRadius,
                color: Theme.of(context).colorScheme.onInverseSurface,
              )),
        ),
        const Gap(Insets.small),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Didint recive the otp? ',
              style: TextStyle(
                fontSize: CustomFontsTheme.smallSize,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColorDark,
                minimumSize: const Size(40, 40),
              ),
              child: const Text(
                'Resend',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: CustomFontsTheme.smallSize,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        GradientBorderButton(onPressed: () {}, text: 'Next'),
      ],
    );
  }
}
