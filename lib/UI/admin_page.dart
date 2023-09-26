import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/UI/welcome_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/wallpaper.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.25, 20, 0),
              child: const Column(
                children: <Widget> [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'WELCOME TO THE',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33, color: Colors.white),
                ),
              ]
              ),
            ),
          ),
          const SizedBox(height: 150,),
        ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
               Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Welcome()));
            },
            child: const Text('log out'))
        ],
      ),
    );
  }
}
