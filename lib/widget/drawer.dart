import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: UserAccountsDrawerHeader(
                accountName: Text('Abdullah Faisal'),
                accountEmail: Text('abdullahfaisal48940@gmail.com'),
                currentAccountPicture: CircleAvatar(backgroundImage: AssetImage('images/abdullah.jpg')),),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(Icons.male),
            title: Text('About'),
          )
        ],
      ),
    );
  }
}
