import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UI/Welcome/login_page.dart';
import 'package:myapp/UI/Welcome/welcome_page.dart';

class AdminSettingPage2 extends StatefulWidget {
  const AdminSettingPage2({Key? key}) : super(key: key);

  @override
  State<AdminSettingPage2> createState() => _AdminSettingPageState();
}

class _AdminSettingPageState extends State<AdminSettingPage2> {
  bool isObscurePassword = true;
  String username = "";
  String email = "";
  String profilePictureUrl = "";
  String password = "";
  bool isLoading = true; // Added

  void fetchUserData() async {
    setState(() {
      isLoading = true;
    });

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').child(user.uid);
        DatabaseEvent event = await userRef.once();
        dynamic data = event.snapshot.value;

        if (!mounted) return;
        if (data != null && data is Map) {
          setState(() {
            username = data['username'] ?? "No Username Found";
            email = data['email'] ?? "No Email Found";
            password = data['password'] ?? "No Password Found";
            profilePictureUrl = data['profilePictureUrl'] ?? '';
          });
        } else {
          setState(() {
            username = "No Data Found";
            email = "No Data Found";
          });
        }
      }
    } catch (e) {
      // Handle errors...

    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void performPasswordReset(String newPassword) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);

        // Show SnackBar for success
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password updated successfully'),
            duration: Duration(seconds: 5),
          ),
        );

        // Update user password in Firebase Database
        DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').child(user.uid);
        await userRef.update({'password': newPassword});
      }
    } catch (e) {
      // Show SnackBar for error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset failed: $e'),
          duration: const Duration(seconds: 5),
        ),
      );

      if (e is FirebaseAuthException && e.code == 'requires-recent-login') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page'),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.pink,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                          color: Colors.pink,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildTextField(username, 'Enter your username', false, false),
              buildTextField(email, 'Enter your Email', false, false),
              buildTextField("*******", 'Change your password', true, true),
              const SizedBox(height: 30),
              // Loading indicator
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LogInScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "LOG OUT",
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      performPasswordReset(password);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("SAVE", style: TextStyle(fontSize: 15, letterSpacing: 2, color: Colors.white)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField, bool isEditable) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: placeholder,
          enabled: isEditable,
        ),
      ),
    );
  }
}
