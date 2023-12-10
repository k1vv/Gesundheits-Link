import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:myapp/UI/Welcome/login_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  Image currentImage = Image.asset("assets/images/placeholder.jpg");
  String profilePictureUrl = '';
  String username = "Loading...";
  String email = "Loading...";
  String password = "******";
  bool showError = false;
  bool showError1 = false;
  bool showError2 = false;
  bool showError3 = false;
  bool showError4 = false;

  final newUsernameController = TextEditingController();
  final newEmailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('users').child(user.uid);
      DatabaseEvent event = await userRef.once();
      dynamic data = event.snapshot.value;

      if (!mounted) return;

      if (data != null && data is Map) {
        setState(() {
          username = data['username'] ?? "No Username Found";
          email = data['email'] ?? "No Email Found";
          profilePictureUrl = data['profilePictureUrl'] ?? '';
        });
      } else {
        setState(() {
          username = "No Data Found";
          email = "No Data Found";
        });
      }
    }
  }

  Future<String?> uploadProfilePicture(File imageFile, String userId) async {
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('profile_pictures/$userId.jpg');
      await storageReference.putFile(imageFile);

      String downloadURL = await storageReference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      if (!mounted) return null;
      debugPrint('Error uploading profile picture: $e');
      return null;
    }
  }

  void changeProfilePicture() async {
    if (!mounted) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (!mounted) return;

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

      if (userId.isNotEmpty) {
        String? imageUrl = await uploadProfilePicture(imageFile, userId);

        if (!mounted) return;

        if (imageUrl != null) {
          setState(() {
            currentImage = Image.file(
              imageFile,
              fit: BoxFit.cover,   
            );
          });
          updateProfilePictureUrl(userId, imageUrl);
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext context) => const MainPage(initialIndex: 4,)),
          );
        }
      }
    }
  }

  void updateProfilePictureUrl(String userId, String imageUrl) async {
    try {
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('users').child(userId);
      await userRef.update({'profilePictureUrl': imageUrl});
      if (!mounted) return;
      debugPrint('Profile picture URL updated in Firebase Realtime Database');
    } catch (e) {
      if (!mounted) return;
      debugPrint('Error updating profile picture URL: $e');
    }
  }

  void changeUsername() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset Username'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: newUsernameController,
                decoration: const InputDecoration(
                  labelText: 'New Username',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (!mounted) return;
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (!mounted) return;
                final newUsername = newUsernameController.text.trim();
                if (newUsername.isNotEmpty) {
                  performUsernameReset(newUsername);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  void performUsernameReset(String newUsername) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('users').child(user.uid);

        await userRef.update({'username': newUsername});

        if (!mounted) return;

        setState(() {
          username = newUsername;
        });
        setState(() {
          showError2 = true;
        });
        Future.delayed(const Duration(seconds: 5), () {
          setState(() {
            showError2 = false;
          });
        });
        debugPrint('Username updated in Firebase Realtime Database');
      }
    } catch (e) {
      if (!mounted) return;
      debugPrint("Username reset failed: $e");
      setState(() {
        showError3 = true;
      });
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          showError3 = false;
        });
      });
    }
  }

  void resetEmail() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset Email'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: newEmailController,
                decoration: const InputDecoration(
                  labelText: 'New Email',
                ),
              ),
              TextFormField(
                controller: passwordController, // Add a TextEditingController for the password
                decoration: const InputDecoration(
                  labelText: 'Current Password',
                ),
                obscureText: true, // This makes the input hidden (for password)
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (!mounted) return;
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (!mounted) return;
                final newEmail = newEmailController.text.trim();
                final password = passwordController.text.trim(); // Get the user's current password
                if (newEmail.isNotEmpty && password.isNotEmpty) {
                  performEmailReset(newEmail, password); // Pass the password to the function
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  void performEmailReset(String newEmail, String password) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Reauthenticate the user before updating email
        AuthCredential credential = EmailAuthProvider.credential(email: user.email!, password: password);
        await user.reauthenticateWithCredential(credential);
  
        // Update email in Firebase Authentication
        await user.updateEmail(newEmail);
  
        // Optionally update email in Realtime Database
        DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').child(user.uid);
        await userRef.update({'email': newEmail});
  
        if (!mounted) return;
  
        setState(() {
          email = newEmail;
        });
  
        // Display a success message or navigate to a new screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email updated successfully'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      debugPrint("Email reset failed: $e");
      // Handle and display error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email reset failed: $e'),
        ),
      );
    }
  }

  void resetPassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (!mounted) return;
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (!mounted) return;
                final newPassword = newPasswordController.text.trim();

                if (newPassword.isNotEmpty) {
                  performPasswordReset(newPassword);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  void performPasswordReset(String newPassword) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        setState(() {
          showError = true;
        });
        Future.delayed(const Duration(seconds: 5), () {
          setState(() {
            showError = false;
          });
        });

        if (!mounted) return;

        setState(() {
          password = '******';
        });

        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('users').child(user.uid);
        await userRef.update({'password': newPassword});
      }
    } catch (e) {
      if (!mounted) return;
      debugPrint("Password reset failed: $e");
      setState(() {
        showError1 = true;
      });
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          showError1 = false;
        });
      });

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
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25 * screenHeight / 375),
                GestureDetector(
                  onTap: () {
                    changeProfilePicture();
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 120, 
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                        child: ClipOval(
                          child: profilePictureUrl.isNotEmpty
                              ? Image.network(
                                  profilePictureUrl,
                                  fit: BoxFit.cover,
                                )
                              : currentImage,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25 * screenHeight / 375,),
                Row(
                  children: [
                    SizedBox(width: 20 * screenWidth / 375,),
                    const Text(
                      "Username", 
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 20 * screenWidth / 375,),
                    SizedBox(
                      width: 250 * screenWidth / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          changeUsername();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: const Color.fromARGB(73, 248, 203, 198),
                          backgroundColor: const Color.fromARGB(73, 248, 203, 198), 
                          foregroundColor: const Color.fromARGB(73, 248, 203, 198),
                          surfaceTintColor: const Color.fromARGB(73, 248, 203, 198),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5 * screenWidth / 375,),
                            Text(
                              username,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 12,                             
                                color: Colors.black,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_forward,
                              color: Color.fromARGB(144, 184, 184, 184),
                              size: 18,
                            ),
                          ],
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10 * screenHeight / 375,),
      
                              Row(
                  children: [
                    SizedBox(width: 20 * screenWidth / 375,),
                    const Text(
                      "Email", 
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 52 * screenWidth / 375,),
                    SizedBox(
                      width: 250 * screenWidth / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          resetEmail();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: const Color.fromARGB(73, 248, 203, 198),
                          backgroundColor: const Color.fromARGB(73, 248, 203, 198), 
                          foregroundColor: const Color.fromARGB(73, 248, 203, 198),
                          surfaceTintColor: const Color.fromARGB(73, 248, 203, 198),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5 * screenWidth / 375,),
                            Text(
                              email,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_forward,
                              color: Color.fromARGB(144, 184, 184, 184),
                              size: 18,
                            ),
                          ],
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10 * screenHeight / 375,),
                Row(
                  children: [
                    SizedBox(width: 20 * screenWidth / 375,),
                    const Text(
                      "Password", 
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 22 * screenWidth / 375,),
                    SizedBox(
                      width: 250 * screenWidth / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          resetPassword();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: const Color.fromARGB(73, 248, 203, 198),
                          backgroundColor: const Color.fromARGB(73, 248, 203, 198), 
                          foregroundColor: const Color.fromARGB(73, 248, 203, 198),
                          surfaceTintColor: const Color.fromARGB(73, 248, 203, 198),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5 * screenWidth / 375,),
                            Text(
                              password,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_forward,
                              color: Color.fromARGB(144, 184, 184, 184),
                              size: 18,
                            ),
                          ],
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20 * screenHeight / 375,),
                 SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(73, 248, 203, 198),
                      surfaceTintColor: const Color.fromARGB(73, 248, 203, 198),               
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                      foregroundColor: const Color.fromARGB(73, 248, 203, 198),
                      shadowColor: const Color.fromARGB(73, 248, 203, 198),
                    ),
                    onPressed: () {
                     FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LogInScreen()),
                      );
                    },
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: Colors.black
                        )
                      ),
                    ),
                  ),
                SizedBox(height: 5.3 * screenHeight / 375,),
                Image.asset("assets/images/hemi.png").animate().fadeIn(duration: 3000.ms)
              ],
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
                      'Password Change Successful',
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
                      'Password should be at least 6 characters',
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
                      'Username Successfully Change',
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
                      'Username already exist',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 60 * fem,
            top: 610 * fem,
            child: AnimatedOpacity(
              opacity: showError4 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 50,
                width: 260,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Profile Picture Successfully Change Please Reload the page',
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
  @override
  void dispose() {
    newPasswordController.dispose();
    newEmailController.dispose();
    super.dispose();
  }
}
