import 'package:app/common_lib.dart';
import 'package:app/src/home/calender/components/custom_calender.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/components/custom_app_bar.dart';
import 'components/custom_time_line.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  DateTime? startRange;
  DateTime? endRange;

  @override
  Widget build(BuildContext context) {
    print('start ${startRange.formatDate()} end: ${endRange.formatDate()}}');
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
              onRangeSelect: (start, end) {
                setState(() {
                  startRange = start;
                  endRange = end;
                });
              },
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
            ListView.builder(
              padding: Insets.noneAll,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                DateTime currentDate = DateTime.now();
                DateTime targetDate = currentDate.add(Duration(days: index));
                bool isNewMonth = index == 0 ||
                    targetDate.month !=
                        currentDate.add(Duration(days: index - 1)).month;
                return CustomTimeLine(
                  content: Container(),
                  date: targetDate,
                  isNewMonth: isNewMonth,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
