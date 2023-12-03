// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:myapp/UI/Admin/settings.dart';
import 'package:myapp/UI/Admin/usees_management.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('WELCOME ADMIN'),
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
            leading: const Icon(Icons.account_circle),
            title: const Text('User Management'),
            onTap: () {
              // Navigate to the UserManagementPage when the ListTile is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserManagement()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              var push = Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminSettingPage2()),
              );
            },
          ),

        ],
      ),
    );
  }
}