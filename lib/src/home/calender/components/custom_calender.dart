import 'package:app/common_lib.dart';
import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui';

class CustomCalendar extends StatefulWidget {
  final Function(DateTime) onDaySelected;

  const CustomCalendar({super.key, required this.onDaySelected});

  @override
  createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
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
                gradient: ColorsTheme.backButtonGardient,
                shape: BoxShape.circle,
              ),
              rangeEndDecoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                gradient: ColorsTheme.selectedDateGradient,
                shape: BoxShape.circle,
              ),
              disabledTextStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontsTheme.bigWeight,
                  fontSize: FontsTheme.mediumSize),
              defaultTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontsTheme.bigWeight,
                  fontSize: FontsTheme.mediumSize),
              weekendTextStyle: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontsTheme.bigWeight,
                  fontSize: FontsTheme.mediumSize),
              outsideTextStyle: TextStyle(
                color: Colors.white.withOpacity(0),
                fontWeight: FontsTheme.bigWeight,
                fontSize: FontsTheme.mediumSize,
              ),
            ),
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
                fontWeight: FontsTheme.bigWeight,
                fontSize: FontsTheme.mediumSize,
              ),
              weekendStyle: const TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.red,
                  fontWeight: FontsTheme.bigWeight,
                  fontSize: FontsTheme.mediumSize),
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
            focusedDay: DateTime.now(),
            firstDay: DateTime.now(),
            lastDay: DateTime(2070, 1, 1),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
              widget.onDaySelected(selectedDay);
            },
          ),
        ),
      ),
    );
  }
}
