import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int bottomIndex;

  AppProvider() {
    bottomIndex = 0;
  }

  void changeBottomIndex(int index) {
    bottomIndex = index;
    notifyListeners();
  }
}
