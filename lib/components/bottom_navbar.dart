import 'package:calorie_calculator/view/add_food_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../screen_index_provider.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<ScreenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;

    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      showSelectedLabels: true,
      elevation: 1.5,
      currentIndex: currentScreenIndex,
      onTap: (value) => _screenindexprovider.updateScreenIndex(value),
      items: [
        BottomNavigationBarItem(
            label: '',
            icon: Icon(
              (currentScreenIndex == 0) ? Icons.home : Icons.home_outlined,
              size: 30,
            ),
            backgroundColor: Colors.orangeAccent
            // provide color to any one icon as it will overwrite the whole bottombar's color ( if provided any )
            ),
        BottomNavigationBarItem(
            label: '',
            icon: Icon(
              (currentScreenIndex == 1) ? Icons.search : Icons.search_outlined,
              size: 30,
            ),
            backgroundColor: Colors.orangeAccent),
      ],
    );
  }
}
