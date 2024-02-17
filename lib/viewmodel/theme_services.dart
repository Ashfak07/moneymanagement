import 'package:flutter/material.dart';

class ThemeServicesProvider with ChangeNotifier {
  bool isDarkModeOn = false;

  void Chandetheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }
}
