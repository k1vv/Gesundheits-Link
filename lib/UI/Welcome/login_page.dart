import 'package:flutter/material.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:myapp/UI/Admin/admin_page.dart';
import 'package:myapp/UI/Welcome/forgotpassword_page.dart';
import 'package:myapp/UI/Welcome/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/Widgets/reusable_widgets.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  bool showError = false;
  bool showError1 = false;

  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );

      final User user = userCredential.user!;
      final String userId = user.uid;
      const String adminid = "q38Pju8MufZvgKSF2AqyJYZYGqF2";

      if (userId == adminid) {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AdminPage()));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainPage(initialIndex: 0,)));
      }
    } catch (e) {
      debugPrint('Error during login: $e');
      setState(() {
        showError1 = true;
      });

      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          showError1 = false;
        });
      });
    }
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text("Don't have an account? ",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

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
                  20, MediaQuery.of(context).size.height * 0.25, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter Email", Icons.person_outline, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                    },
                    child: const Text(
                      "Forgot Your Password"
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.2, 10, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_emailTextController.text.isNotEmpty &&
                            _passwordTextController.text.isNotEmpty) {
                          login();
                        } else {
                          setState(() {
                            showError = true;
                          });
                          Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              showError = false;
                            });
                          });
                        }
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Log In',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffff6079)),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320, 50),
                      ),
                    ),
                  ),
                  signUpOption()
                ],
              ),
            ),
          ),
          Positioned(
            left: 110 * fem,
            top: 550 * fem,
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
                      'Empty email or password',
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
            top: 550 * fem,
            child: AnimatedOpacity(
              opacity: showError1 ? 1.0 : 0.0,
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
                      'Invalid email or password',
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
}
