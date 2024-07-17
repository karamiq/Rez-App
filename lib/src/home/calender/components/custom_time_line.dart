import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common_lib.dart';
import '../../components/party_card.dart';

class CustomTimeLine extends StatefulWidget {
  const CustomTimeLine({
    super.key,
    required this.date,
    required this.content,
    required this.isNewMonth,
  });
  final Widget content;
  final DateTime date;
  final bool isNewMonth;

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

  String getMonthName(int month) {
    List<String> monthNames = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];
    return monthNames[month - 1];
  }

  String getDayName(int weekday) {
    List<String> dayNames = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return dayNames[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    double dotHeight = 4.0;
    double dotPadding = Insets.smallAll.vertical;
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
                Column(
                  children: [
                    if (widget.isNewMonth)
                      Text(
                        getMonthName(widget.date.month),
                        style: TextStyle(
                            fontFamily: GoogleFonts.workSans().fontFamily,
                            fontWeight: FontsTheme.bigWeight,
                            fontSize: FontsTheme.smallSize),
                      ),
                    Container(
                      padding: Insets.smallAll,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xaF6A2275),
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.date.day.toString(),
                            style: const TextStyle(
                                color: ColorsTheme.primary,
                                fontSize: FontsTheme.mediumBigSize),
                          ),
                          Text(
                            getDayName(widget.date.weekday),
                            style: TextStyle(
                                fontFamily: GoogleFonts.workSans().fontFamily,
                                color: const Color(0xFF6A2275),
                                fontWeight: FontsTheme.bigWeight,
                                fontSize: FontsTheme.verySmallSize),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(Insets.small),
                ...List.generate(
                  numberOfDots + 8,
                  (index) => Padding(
                    padding: Insets.extraSmallAll,
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
        const Gap(Insets.small),
        Expanded(
            flex: 6,
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
                    expiredDate: DateTime.now()),
                const Gap(Insets.small),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            scale: 2,
                            'https://www.shutterstock.com/shutterstock/photos/93645934/display_1500/stock-photo-large-school-of-wild-sardines-in-the-ocean-93645934.jpg')),
                    color: Colors.red,
                    borderRadius: BorderSize.smallRadius,
                  ),
                  child: SizedBox(
                    height: 40,
                    child: InkWell(
                      onTap: () {
                        print('object');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Insets.medium),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '3 events more',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: FontsTheme.mediumBigSize,
                                  fontFamily: GoogleFonts.nunito().fontFamily),
                            ),
                            const Icon(Icons.chevron_right_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
