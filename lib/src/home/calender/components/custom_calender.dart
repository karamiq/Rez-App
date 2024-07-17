import 'package:app/common_lib.dart';
import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui';

class CustomCalendar extends StatefulWidget {
  final Function(DateTime) onDaySelected;

  CustomCalendar({required this.onDaySelected});

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
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
          color: Colors.grey.withOpacity(0.1),
          child: TableCalendar(
            calendarStyle: CalendarStyle(
              holidayTextStyle: const TextStyle(color: Colors.red),
              todayDecoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              rangeEndDecoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                gradient: ColorsTheme.selectedDateGradient,
                shape: BoxShape.circle,
              ),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              weekendStyle: TextStyle(
                fontFamily: 'Inter',
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              decoration: BoxDecoration(
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
