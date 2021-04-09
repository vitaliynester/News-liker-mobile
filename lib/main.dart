import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/HomePage.dart';
import './providers/AppProvider.dart';
import './providers/NewsProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Новости Липецкой области",
        theme: ThemeData(
          primaryColor: Colors.white,
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            color: Colors.white,
            elevation: 0,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
