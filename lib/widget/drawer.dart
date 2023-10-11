import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text('Abdullah Faisal'),
              accountEmail: Text('abdullahfaisal48940@gmail.com'),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/abdullah.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text(
              'About',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text(
              'Sign Out',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
