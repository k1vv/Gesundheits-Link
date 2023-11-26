//import 'package:admin_2/read_listview.dart';
import 'package:admin_example/setting.dart';
import 'package:admin_example/usermanagement.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('WELCOME ADMIN'),
            currentAccountPicture: CircleAvatar(
              child: CircleAvatar(
                child: Icon(
                  Icons.account_circle,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
            ), accountEmail: null,
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('User Management'),
            onTap: () {
              // Navigate to the UserManagementPage when the ListTile is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReadListView()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              var push = Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminSettingPage2()),
              );
            },
          ),

        ],
      ),
    );
  }
}


