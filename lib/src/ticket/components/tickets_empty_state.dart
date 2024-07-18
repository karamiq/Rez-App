import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common_lib.dart';

class TicketsEmptyState extends StatelessWidget {
  const TicketsEmptyState({
    super.key,
    required this.populers,
    required this.title,
    required this.subtitle,
    required this.appearPopuler,
  });

  final List<Map<String, String>> populers;
  final String title;
  final String subtitle;
  final bool appearPopuler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(Assets.assetsImagesNoTickets),
            if (appearPopuler)
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
              top: 125,
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
                              child: Text(populers[index].keys.first),
                            ),
                          ))),
            )
          ],
        ),
        const Gap(Insets.large),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontsTheme.bigWeight,
            fontSize: FontsTheme.bigSize,
          ),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorsTheme.subtitle,
          ),
        ),
      ],
    );
  }
}
/* */