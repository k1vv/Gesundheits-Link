import 'package:flutter/material.dart';

const kDefaultPadding = EdgeInsets.all(16.0);
const kPrimaryColor = Colors.pink;
const kTextFieldColor = Colors.white; // Adjust as needed
const kTextColor = Colors.white; // Set text color to white

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/backgroundimage.png', // Replace with your image file name
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: CircularButton(
              onPressed: () {
                // Add your circular button logic here
                debugPrint('Circular button pressed');
              },
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
                    // Navigate to the login screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInScreen(),
                      ),
                    );
                  },
                  child: PrimaryButton(
                    buttonText: 'Reset Password',
                    onPressed: () {
                      // Add your reset password logic here
                      debugPrint('Reset Password button pressed');
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

class CircularButton extends StatelessWidget {
  final Function onPressed;

  const CircularButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      child: GestureDetector(
        onTap: () {
          onPressed();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.5),
        ),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      ),
    );
  }
}

class ResetForm extends StatelessWidget {
  const ResetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(color: kTextColor),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const PrimaryButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Execute the provided onPressed function
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.5), // Set your primary color with 50% transparency
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
        ),
        minimumSize: const Size(double.infinity, 48), // Make the button longer
      ),
      child: Text(buttonText, style: const TextStyle(color: kTextColor)),
    );
  }
}

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: kTextColor)),
      ),
      body: const Center(
        child: Text('Login Screen', style: TextStyle(color: kTextColor)),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ForgotPassword(),
  ));
}