import 'package:flutter/material.dart';

class Breakfast extends StatelessWidget {
  const Breakfast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.only(left: 10),
      height: 265,
      width: 275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Breakfast",
                  style: MealTextStyle.allMealTextStyle,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.upgrade,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Row(
              children: [
                SizedBox(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2000",
                          style: MealTextStyle.allMealTextStyle,
                        ),
                        Text(
                          "kCal",
                          style: MealTextStyle.allMealTextStyle,
                        ),
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ], // I'm gonna add Gridview.count here
      ),
    );
  }
}

class Launch extends StatelessWidget {
  const Launch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 265,
      width: 275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Launch",
                  style: MealTextStyle.allMealTextStyle,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.upgrade,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Row(
              children: [],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ], // I'm gonna add Gridview.count here
      ),
    );
  }
}

class Dinner extends StatelessWidget {
  const Dinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 265,
      width: 275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dinner",
                  style: MealTextStyle.allMealTextStyle,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.upgrade,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Row(
              children: [],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ], // I'm gonna add Gridview.count here
      ),
    );
  }
}

class Snacks extends StatelessWidget {
  const Snacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.only(right: 10),
      height: 265,
      width: 275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Snacks",
                  style: MealTextStyle.allMealTextStyle,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.upgrade,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Row(
              children: [],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ], // I'm gonna add Gridview.count here
      ),
    );
  }
}

class MealTextStyle {
  static const allMealTextStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19);
}
