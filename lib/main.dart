import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:calorie_calculator/screen_index_provider.dart';
import 'package:calorie_calculator/view_modal/providers/food_api_provider.dart';

import 'package:calorie_calculator/view_modal/services/searc_service.dart';
import 'package:calorie_calculator/view/add_food_view.dart';

import 'package:calorie_calculator/view/login_view.dart';
import 'package:calorie_calculator/view/search_food_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SearchService searchService = SearchService();
    searchService.getNutrition("");
    return MultiProvider(
      providers: [
        ListenableProvider<ScreenIndexProvider>(
            create: (_) => ScreenIndexProvider()),
        ListenableProvider<FoodApiProvider>(create: (_) => FoodApiProvider()),
      ],
      child: MaterialApp(
          title: 'Calorie Calculator',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AnimatedSplashScreen(
              splash: const Icon(
                Icons.fastfood_sharp,
                color: Colors.white,
                size: 90,
              ),
              duration: 3000,
              splashTransition: SplashTransition.rotationTransition,
              backgroundColor: Colors.amber,
              nextScreen: Material(child: LoginPage()))),
    );
  }
}
