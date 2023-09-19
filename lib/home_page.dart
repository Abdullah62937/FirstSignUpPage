import 'package:abd_garments/main.dart';
import 'package:abd_garments/widget/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AG App'),
      ),
      body: Center(
        child: Container(
          child: Text("Wwlcome to Home Page"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}