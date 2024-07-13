import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FourthIntroPage extends StatelessWidget {
  const FourthIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(),
            const Spacer(),
            //SvgPicture.asset(Assets.assetsSvgWave),
            const Spacer(),
            const Gap(Insets.extraLarge),
            Text(
              'Let The Music go Into your Ears',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: GoogleFonts.bebasNeue().fontFamily,
                  fontWeight: FontsTheme.mediumBigWeight,
                  fontSize: FontsTheme.veryBigSize),
            ),
            const Gap(Insets.extraLarge * 1.5),
            Padding(
              padding: Insets.mediumAll,
              child: Column(
                children: [
                  GradientBorderButton(
                      onPressed: () {
                        context.go(RoutesDocument.tabs);
                      },
                      text: 'Next'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
