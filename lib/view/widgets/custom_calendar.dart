import 'package:calorie_calculator/view/widgets/timeline_calendar.dart';
import 'package:flutter/material.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: TimelineCalendar(),
    );
  }
}
