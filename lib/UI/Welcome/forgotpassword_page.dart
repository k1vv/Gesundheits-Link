import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UI/Welcome/test.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordPage({super.key});

  Future<void> resetPassword(BuildContext context) async {
  // Check if the email field is empty
  if (emailController.text.isEmpty) {
    // Show a snackbar with an error message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email cannot be empty'),
        duration: Duration(seconds: 2),
      ),
    );
    return; // Stop further execution of the function
  }

  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: emailController.text,
    );
    // Show a success message or navigate to a login page
    debugPrint("Password reset email sent successfully");
  } catch (e) {
    // Show an error message
    debugPrint("Error sending password reset email: $e");
    // You might also want to show an error snackbar here
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/wallpaper.png', // Replace with your image file name
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kTextColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Please enter your email address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kTextColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ResetForm(),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    resetPassword(context);
                  },
                  child: PrimaryButton(
                    buttonText: 'Reset Password',
                    onPressed: () {
                      resetPassword(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
