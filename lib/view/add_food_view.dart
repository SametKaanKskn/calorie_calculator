import 'package:calorie_calculator/view/widgets/custom_apptop.dart';
import 'package:calorie_calculator/view/widgets/custom_calendar.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_Listview.dart';

class AddNutrition extends StatefulWidget {
  const AddNutrition({super.key});

  @override
  State<AddNutrition> createState() => _AddNutritionState();
}

class _AddNutritionState extends State<AddNutrition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          CustomAppTop(),
          CustomCalendar(),
          Divider(
            height: 10,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Breakfast(),
                SizedBox(
                  width: 30,
                ),
                Launch(),
                SizedBox(
                  width: 30,
                ),
                Dinner(),
                SizedBox(
                  width: 30,
                ),
                Snacks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
