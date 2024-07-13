import 'dart:ui';

import 'package:app/common_lib.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/components/custom_app_bar.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: Insets.mediumAll,
      body: Column(
        children: [
          CustomAppBar(
            title: 'Choose seats',
            showCalender: false,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                    padding: Insets.mediumAll,
                    color: Colors.grey.withOpacity(0.1),
                    child: TableCalendar(
                      calendarStyle: const CalendarStyle(
                        holidayTextStyle: TextStyle(color: Colors.red),
                        todayDecoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                        rangeEndDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        weekendStyle: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: .3,
                            ),
                          ),
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        titleTextStyle: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: Colors.white,
                          fontSize: FontsTheme.mediumBigSize,
                          fontWeight: FontWeight.bold,
                        ),
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                      availableGestures: AvailableGestures.all,
                      pageJumpingEnabled: true,
                      rangeSelectionMode: RangeSelectionMode.toggledOn,
                      daysOfWeekHeight: 50,
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.now(),
                      lastDay: DateTime(2070, 1, 1),
                    ))),
          )
        ],
      ),
    );
  }
}
