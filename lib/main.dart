import 'package:abd_garments/home_page.dart';
import 'package:abd_garments/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/":(context) => LoginPage(),
        "/Home":(context) => HomePage()
      },
    );
  }
}