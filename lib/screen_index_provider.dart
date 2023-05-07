import 'package:flutter/material.dart';

class ScreenIndexProvider extends ChangeNotifier {
  int _screenIndex = 0; // Initial index of the screen
  // function to return the current screen Index
  int get fetchCurrentScreenIndex => _screenIndex;

  void updateScreenIndex(int newIndex) {
    // function to update the screenIndex
    _screenIndex = newIndex;
    notifyListeners(); // This will notify every listeners that the screen index has been changed
  }
}
