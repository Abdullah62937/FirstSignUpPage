import 'package:abd_garments/home_page.dart';
import 'package:abd_garments/login_page.dart';
import 'package:abd_garments/widget/themes.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => LoginPage(),
        "/Home":(context) => HomePage()
      },
    );
  }
} 