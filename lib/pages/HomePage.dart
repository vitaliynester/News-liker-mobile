import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/AppProvider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Новости Липецкой области",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.green,
            onTap: appProvider.changeBottomIndex,
            currentIndex: appProvider.bottomIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Новости",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Избранное",
              ),
            ],
          ),
          body: appProvider.getPageFromBottomNavigator(),
        );
      },
    );
  }
}
