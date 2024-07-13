import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_lib.dart';
import '../../utils/components/buttons/gardient_border_button.dart';
import '../../utils/components/custom_scaffold.dart';
import 'components/animation.dart';

class SecondIntroPage extends StatefulWidget {
  const SecondIntroPage({super.key});

  @override
  State<SecondIntroPage> createState() => _SecondIntroPageState();
}

class _SecondIntroPageState extends State<SecondIntroPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: Insets.mediumAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(75),
              const SizedBox(
                height: 400,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AnimatedUpDownWidget(),
                  ],
                ),
              ),
              const Spacer(),
              const Gap(Insets.extraLarge),
              Text(
                'Let The Music go Into your Ears ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: GoogleFonts.exo().fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: FontsTheme.veryBigSize,
                ),
              ),
              const Gap(Insets.extraLarge),
              GradientBorderButton(
                onPressed: () {
                  context.go(RoutesDocument.tabs);
                },
                text: 'Start',
                isShadow: false,
                borderColors: const [Color(0xFFff23d5), Color(0xFF3f1270)],
                colors: const [
                  Color(0xFFb5116b),
                  Color(0xFFa7116b),
                  Color(0xFF8b116d),
                  Color(0xFF69126e),
                  Color(0xFF3f1270),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
