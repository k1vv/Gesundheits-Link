import 'package:flutter/material.dart';
import 'package:myapp/Widgets/reusable_widgets.dart';
import 'package:myapp/UI/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _userEmailTextController =
      TextEditingController();
  final TextEditingController _userPasswordTextController =
      TextEditingController();
  final TextEditingController _userConfirmPasswordTextController =
      TextEditingController();
  String errorMessage = '';
  bool showError = false;
  bool showError1 = false;
  bool showError2 = false;
  bool showError3 = false;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.18, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter Username", Icons.person_outline,
                      false, _userNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Email", Icons.email_outlined, false,
                      _userEmailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _userPasswordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Confirm Password", Icons.lock_outline,
                      true, _userConfirmPasswordTextController),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.1, 10, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_userNameTextController.text.isNotEmpty &&
                            _userEmailTextController.text.isNotEmpty &&
                            _userPasswordTextController.text.isNotEmpty &&
                            _userConfirmPasswordTextController
                                .text.isNotEmpty &&
                            _userPasswordTextController.text.length > 6 &&
                            _userConfirmPasswordTextController.text ==
                                _userPasswordTextController.text) {
                          register();
                        } else if (_userNameTextController.text.isEmpty ||
                            _userEmailTextController.text.isEmpty ||
                            _userPasswordTextController.text.isEmpty ||
                            _userConfirmPasswordTextController.text.isEmpty) {
                          setState(() {
                            showError = true;
                          });
                          Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              showError = false;
                            });
                          });
                        } else if (_userPasswordTextController.text.length <=
                            6) {
                          setState(() {
                            showError1 = true;
                          });
                          Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              showError1 = false;
                            });
                          });
                        } else if (_userConfirmPasswordTextController.text !=
                            _userPasswordTextController.text) {
                          setState(() {
                            showError2 = true;
                          });
                          Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              showError2 = false;
                            });
                          });
                        }
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Sign Up',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffff6079)),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320, 50),
                      ),
                    ),
                  ),
                  logInOption()
                ],
              ),
            ),
          ),
          Positioned(
            left: 110 * fem,
            top: 610 * fem,
            child: AnimatedOpacity(
              opacity: showError ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 50,
                width: 180,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Please fill in all the form',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 110 * fem,
            top: 610 * fem,
            child: AnimatedOpacity(
              opacity: showError1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500), // Set the duration
              child: SizedBox(
                height: 50,
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Password length must be bigger than 6 character",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 110 * fem,
            top: 610 * fem,
            child: AnimatedOpacity(
              opacity: showError2 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500), // Set the duration
              child: SizedBox(
                height: 50,
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Your password doesn't match",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 110 * fem,
            top: 610 * fem,
            child: AnimatedOpacity(
              opacity: showError3 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500), // Set the duration
              child: SizedBox(
                height: 50,
                width: 180,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Unsucessful Registration',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<DataSnapshot> checkUsernameExists(String username) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    return await databaseReference.child('username').child(username).get();
  }

  Future<void> register() async {
    final auth = FirebaseAuth.instance;
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: _userEmailTextController.text,
        password: _userPasswordTextController.text,
      );

      await auth.signOut();
      final User user = userCredential.user!;
      createUserInDatabase(user.uid);
    } catch (e) {
      setState(() {
        showError3 = true;
      });
      // Schedule a callback to hide the error message after 5 seconds
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          showError3 = false;
        });
      });
    }
  }

  void createUserInDatabase(String userId) {
    final databaseReference = FirebaseDatabase.instance.ref();

    Map<String, dynamic> userData = {
      'username': _userNameTextController.text,
      'email': _userEmailTextController.text,
      'password': _userPasswordTextController.text,
      'gender': 'N/A',
      'dateofbirth': 'N/A',
    };

    databaseReference.child('users').child(userId).set(userData).then((_) {
      debugPrint('User added to the database');
      Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LogInScreen()));
    }).catchError((error) {
      debugPrint('Error adding user to the database: $error');
    });
  }

  Row logInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LogInScreen()));
          },
          child: const Text(
            " Log In",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
