import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.white,size: 36)
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
      ),
      home: HomeScreen(),
    );
  }
}
