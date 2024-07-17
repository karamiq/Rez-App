import 'dart:ui';

import 'package:app/common_lib.dart';
import 'package:app/src/home/calender/components/custom_calender.dart';
import 'package:app/src/home/components/party_card.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utils/components/custom_app_bar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    print(_selectedDay?.format());
    return CustomScaffold(
      padding: Insets.mediumAll,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Choose seats',
              showCalender: false,
            ),
            CustomCalendar(
              onDaySelected: (p0) => _selectedDay = p0,
            ),
            const Gap(Insets.extraLarge * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming',
                  style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      fontWeight: FontsTheme.bigWeight,
                      fontSize: FontsTheme.mediumVeryBigSize),
                ),
                IconButton.filled(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: ColorsTheme.primary),
                    icon: const Icon(Icons.chevron_right_rounded))
              ],
            ),
            const Gap(Insets.medium),
            const CustomTimeLine(),
            const CustomTimeLine(),
          ],
        ),
      ),
    );
  }
}

class CustomTimeLine extends StatefulWidget {
  const CustomTimeLine({
    super.key,
  });

  @override
  State<CustomTimeLine> createState() => _CustomTimeLineState();
}

class _CustomTimeLineState extends State<CustomTimeLine> {
  final GlobalKey _widgetKey = GlobalKey();
  Size size = const Size(0, 0);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox =
          _widgetKey.currentContext?.findRenderObject() as RenderBox;
      size = renderBox.size;
      print('Height: ${size.height}, Width: ${size.width}');
      setState(() {}); // Rebuild to update the dots based on the new size
    });
  }

  @override
  Widget build(BuildContext context) {
    double dotHeight = 4.0;
    double dotPadding = Insets.smallAll.vertical; // Assuming vertical padding
    double totalDotHeight = dotHeight + dotPadding;
    int numberOfDots = (size.height / totalDotHeight).floor();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: Insets.smallAll,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xaF6A2275),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '12',
                        style: TextStyle(
                            color: ColorsTheme.primary,
                            fontSize: FontsTheme.mediumBigSize),
                      ),
                      Text(
                        'Thu',
                        style: TextStyle(
                            fontFamily: GoogleFonts.workSans().fontFamily,
                            color: const Color(0xFF6A2275),
                            fontWeight: FontsTheme.bigWeight,
                            fontSize: FontsTheme.verySmallSize),
                      ),
                    ],
                  ),
                ),
                const Gap(Insets.small),
                ...List.generate(
                  numberOfDots,
                  (index) => Padding(
                    padding: Insets.smallAll,
                    child: Container(
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
        const Gap(Insets.large),
        Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(top: Insets.medium),
              child: Column(
                key: _widgetKey,
                children: [
                  PartyCard(
                      imageUrl:
                          'https://www.shutterstock.com/shutterstock/photos/310965713/display_1500/stock-photo-the-rocky-shore-or-beach-andaman-sea-thailand-310965713.jpg',
                      title: 'title',
                      genre: 'genre',
                      ticketInfo: '€40 - €90',
                      isExpired: false,
                      expiredDate: DateTime.now())
                ],
              ),
            )),
      ],
    );
  }
}
