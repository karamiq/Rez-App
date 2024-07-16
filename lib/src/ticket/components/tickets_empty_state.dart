import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common_lib.dart';

class TicketsEmptyState extends StatelessWidget {
  const TicketsEmptyState({
    super.key,
    required this.titles,
  });

  final List<Map<String, String>> titles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(Assets.assetsImagesNoTickets),
            Positioned(
              top: 80,
              left: 20,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Populer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: GoogleFonts.workSans().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: FontsTheme.mediumBigSize,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Insets.small),
                            child: ElevatedButton(
                              onPressed: () => context
                                  .pushNamed(RoutesDocument.availableTickets),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      ColorsTheme.hint.withOpacity(.5)),
                              child: Text(titles[index].keys.first),
                            ),
                          ))),
            )
          ],
        ),
        const Gap(Insets.large),
        const Text(
          'No Tickets Bought',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontsTheme.bigWeight,
            fontSize: FontsTheme.bigSize,
          ),
        ),
        const Text(
          'It appears you haven’t bought any tickets yet. Maybe try these?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsTheme.subtitle,
          ),
        ),
      ],
    );
  }
}
/* */