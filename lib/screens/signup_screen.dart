import 'package:flutter/material.dart';
import 'package:myfirst_flutter_project/utils/color_utils.dart';

import '../reusable_widgets/reusable_widgets.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen ({Key? key}) : super(key: key);


  @override
  _SignUpScreenState createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 78, 124, 1),
        elevation: 0,
        title: const Text(
          "SIGN UP",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body : Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("FF6079"),
            hexStringToColor("FF6079"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
         child: Padding(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                
                const SizedBox(
                  height:20,
                 ),
                 reusableTextField("Enter Username", Icons.person_outline,false,
                 _userNameTextController),

                 const SizedBox(
                  height:20,
                 ),
                 reusableTextField("Enter Password", Icons.lock_outline, true,
                 _emailTextController),
                  const SizedBox(
                  height:20,
                 ),
                 reusableTextField("Confirm Password", Icons.lock_outline, true,
                 _passwordTextController),
                 const SizedBox(
                  height:20,
                 ),
                 signInSignUpButton(context, false,(){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
                  
                 })
  ],
    ),
            ))),
    );
  }
}