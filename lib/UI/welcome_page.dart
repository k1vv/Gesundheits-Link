import 'package:flutter/material.dart';
import 'package:myapp/UI/login_page.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/wallpaper.png', // Replace with your image asset path
            fit: BoxFit.cover, // Adjust this to your needs
            width: double.infinity,
            height: double.infinity,
          ),
          // Existing Content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.25, 20, 0),
              child: Column(
                children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'GESUNDHEITS LINK',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33, color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'FIND OUT EXACTLY WHAT DIET AND TRAINING WILL WORK SPECIALLY FOR YOU',
                  style: TextStyle(fontSize: 12, color: Colors.white),textAlign: TextAlign.center,
                ),

                Padding(        
                  padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LogInScreen()));
                    },
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'Welcome',
                      style: TextStyle(fontSize: 20 ,color: Color(0xffff6079)),
                    ),
                    style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320, 50),
                    ),
                  ),
                ),
              ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
