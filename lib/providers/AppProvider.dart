import 'package:flutter/material.dart';

import '../pages/NewsFavoriteListPage.dart';
import '../pages/NewsListPage.dart';

class AppProvider extends ChangeNotifier {
  int bottomIndex;

  AppProvider() {
    bottomIndex = 0;
  }

  void changeBottomIndex(int index) {
    bottomIndex = index;
    notifyListeners();
  }

  Widget getPageFromBottomNavigator() {
    switch (bottomIndex) {
      case 0:
        return NewsListPage();
      case 1:
        return NewsFavoriteListPage();
      default:
        return Scaffold();
    }
  }
}
