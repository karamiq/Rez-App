import 'package:app/common_lib.dart';
import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui';

import 'package:timeago/timeago.dart';

class CustomCalendar extends StatefulWidget {
  final Function(DateTime? start, DateTime? end) onRangeSelect;

  const CustomCalendar({super.key, required this.onRangeSelect});

  @override
  createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  Widget build(BuildContext context) {
    void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
      setState(() {
        _rangeStart = start;
        _rangeEnd = end;
        widget.onRangeSelect(start, end);
      });
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: Insets.mediumAll,
          decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.25),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFD390FF),
                Color(0xFF6E1B93),
              ],
              stops: [0.2, 0.8],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: TableCalendar(
            calendarStyle: CalendarStyle(
                holidayTextStyle: const TextStyle(color: Colors.red),
                todayDecoration: const BoxDecoration(
                  color: ColorsTheme.currentDay,
                  shape: BoxShape.circle,
                ),
                rangeStartDecoration: const BoxDecoration(
                    shape: BoxShape.circle, color: ColorsTheme.selectedDay),
                rangeEndDecoration: const BoxDecoration(
                    shape: BoxShape.circle, color: ColorsTheme.selectedDay),
                selectedDecoration: const BoxDecoration(
                  color: ColorsTheme.selectedDay,
                  shape: BoxShape.circle,
                ),
                disabledTextStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: FontsTheme.mediumBigSize),
                defaultTextStyle: const TextStyle(
                    color: Colors.white, fontSize: FontsTheme.mediumBigSize),
                weekendTextStyle: const TextStyle(
                    color: Colors.red, fontSize: FontsTheme.mediumBigSize),
                outsideTextStyle: TextStyle(
                  color: Colors.white.withOpacity(0),
                  fontSize: FontsTheme.mediumBigSize,
                ),
                rangeEndTextStyle: const TextStyle(
                    color: Colors.white, fontSize: FontsTheme.mediumBigSize),
                rangeStartTextStyle: const TextStyle(
                    color: Colors.white, fontSize: FontsTheme.mediumBigSize),
                withinRangeTextStyle: const TextStyle(
                    color: Colors.white, fontSize: FontsTheme.mediumBigSize),
                selectedTextStyle: const TextStyle(
                    color: Colors.white, fontSize: FontsTheme.mediumBigSize),
                rangeHighlightColor: ColorsTheme.selectedDay),
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) {
                return date.weekday == DateTime.monday
                    ? 'M'
                    : date.weekday == DateTime.tuesday
                        ? 'T'
                        : date.weekday == DateTime.wednesday
                            ? 'W'
                            : date.weekday == DateTime.thursday
                                ? 'T'
                                : date.weekday == DateTime.friday
                                    ? 'F'
                                    : date.weekday == DateTime.saturday
                                        ? 'S'
                                        : 'S';
              },
              weekdayStyle: const TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontWeight: FontsTheme.mediumBigWeight,
                fontSize: FontsTheme.mediumBigSize,
              ),
              weekendStyle: const TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.red,
                  fontWeight: FontsTheme.mediumBigWeight,
                  fontSize: FontsTheme.mediumBigSize),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: .3,
                  ),
                ),
              ),
            ),
            headerStyle: const HeaderStyle(
              leftChevronVisible: false,
              rightChevronVisible: false,
              titleTextStyle: TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              titleCentered: true,
              formatButtonVisible: false,
            ),
            availableGestures: AvailableGestures.all,
            pageJumpingEnabled: true,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            daysOfWeekHeight: 50,
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            focusedDay: DateTime.now(),
            firstDay: DateTime.now(),
            lastDay: DateTime(2070, 1, 1),
            onRangeSelected: onRangeSelected,
          ),
        ),
      ),
    );
  }
}
