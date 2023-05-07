import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class TimelineCalendar extends StatefulWidget {
  TimelineCalendar({super.key});

  @override
  State<TimelineCalendar> createState() => _TimelineCalendarState();
}

class _TimelineCalendarState extends State<TimelineCalendar> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      showYears: false,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
      onDateSelected: (date) => setState(() => _selectedDate = date),
      leftMargin: 20,
      monthColor: Colors.black,
      dayColor: Colors.teal[200],
      dayNameColor: const Color(0xFF333A47),
      activeDayColor: Colors.black,
      activeBackgroundDayColor: Color.fromARGB(255, 245, 183, 102),
      dotsColor: const Color(0xFF333A47),
      selectableDayPredicate: (date) => date.day != 23,
      locale: 'en',
    );
  }
}
