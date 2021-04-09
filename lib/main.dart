import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Новости",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Информация",
          ),
        ],
      ),
      body: Center(
        child: Text("TEST"),
      ),
    );
  }
}
