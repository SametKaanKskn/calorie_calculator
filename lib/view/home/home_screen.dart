import 'package:calorie_calculator/components/bottom_navbar.dart';
import 'package:calorie_calculator/view/search_food_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:calorie_calculator/screen_index_provider.dart';
import '../../pages/search_page.dart';
import '../../view_model/home_page_view_model.dart';
import '../add_food_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<ScreenIndexProvider>(context);

    var screens = [
      AddNutrition(),
      SearchPage(),
    ];
    return Scaffold(
      body: screens[_screenindexprovider.fetchCurrentScreenIndex],
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
