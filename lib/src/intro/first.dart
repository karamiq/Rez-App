import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FirstIntroPage extends StatelessWidget {
  const FirstIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: Insets.mediumAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(),
              const Gap(75),
              Container(
                height: 300,
                width: 300,
                padding: const EdgeInsets.all(Insets.small / 2),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF5e5afe),
                          Color(0xFF3e3e7e),
                          Colors.transparent,
                          Color(0xFF57356e),
                          Color(0xFFb60eb6)
                        ]),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(-10, -10),
                        blurRadius: 50,
                        spreadRadius: 0,
                        color: Color.fromARGB(69, 93, 90, 254),
                      ),
                      BoxShadow(
                          offset: Offset(10, 10),
                          blurRadius: 50,
                          spreadRadius: 0,
                          color: Color.fromARGB(70, 182, 14, 182))
                    ]),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: ClipOval(
                    child: Transform.scale(
                      origin: const Offset(40, -80),
                      scale: 1.25,
                      child: Image.asset(
                        Assets.assetsGifsDj,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Gap(Insets.extraLarge),
              Text(
                'DJ ROLL Lets Party Togother',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: GoogleFonts.exo().fontFamily,
                    fontWeight: FontsTheme.mediumBigWeight,
                    fontSize: FontsTheme.veryBigSize),
              ),
              const Gap(Insets.extraLarge),
              GradientBorderButton(
                  onPressed: () {
                    context.go(RoutesDocument.intro2);
                  },
                  text: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
