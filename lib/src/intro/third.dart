import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_lib.dart';
import '../../utils/components/buttons/gardient_border_button.dart';
import '../../utils/components/custom_scaffold.dart';
import 'components/animation.dart';

class ThirdIntroPage extends StatefulWidget {
  const ThirdIntroPage({super.key});

  @override
  State<ThirdIntroPage> createState() => _ThirdIntroPageState();
}

class _ThirdIntroPageState extends State<ThirdIntroPage> {
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
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //1
                    AnimatedUpDownWidget(
                      start: 50,
                      startStop: 80,
                      end: 100,
                      endStop: 20,
                    ),
                    //2
                    AnimatedOppositeUpDownWidget(
                      start: 20,
                      startStop: 100,
                      end: 80,
                      endStop: 40,
                    ),

                    //3
                    AnimatedUpDownWidget(
                      start: 70,
                      startStop: 120,
                      end: 90,
                      endStop: 30,
                    ),
                    //4
                    AnimatedOppositeUpDownWidget(
                      start: 0,
                      startStop: 90,
                      end: 110,
                      endStop: 80,
                    ),
                    //5
                    AnimatedUpDownWidget(
                      start: 100,
                      startStop: 20,
                      end: 70,
                      endStop: 50,
                    ),
                    //6
                    AnimatedOppositeUpDownWidget(
                      start: 00,
                      startStop: 90,
                      end: 100,
                      endStop: 40,
                    ),
                    //7
                    AnimatedUpDownWidget(
                      start: 10,
                      startStop: 60,
                      end: 50,
                      endStop: 20,
                    ),
                    //8
                    AnimatedOppositeUpDownWidget(
                      startStop: 80,
                      start: 120,
                      endStop: 20,
                      end: 0,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Gap(Insets.extraLarge * 2),
              Text(
                'Let The Music go Into your Ears ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: GoogleFonts.exo().fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: FontsTheme.veryBigSize,
                ),
              ),
              const Gap(Insets.extraLarge * 2),
              GradientBorderButton(
                onPressed: () {
                  context.go(RoutesDocument.intro4);
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
