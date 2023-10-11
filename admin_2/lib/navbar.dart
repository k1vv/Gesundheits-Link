import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({ super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,


        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Admin Zinnirah'),
            accountEmail: const Text('zinnirahabin@gmi.edu.my'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/profile.jpg'),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
            ),
          ),
          
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('User Management'),
            onTap: ()=> print('User Tapped'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: ()=> print('Notifications Tapped'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: ()=> print('Settings Tapped'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: ()=> print('Sign Out'),
          ),
          

        ],
      ),
    );
  }
}
