import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controller/google_auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final GoogleAuthController _googleAuthController = GoogleAuthController();

  // Check if the user is already signed in
  void _checkIfLoggedIn(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // If the user is already logged in, navigate to the next screen (e.g., Profile or MainScreen)
      Navigator.pushReplacementNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check login status when the screen is built
    _checkIfLoggedIn(context);

    return Scaffold(
      backgroundColor: Color(0xFF1A1F38),
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Neumorphic(
              style: const NeumorphicStyle(
                shape: NeumorphicShape.flat,
                depth: 4,
                color: Color(0xFF2C3252),
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_pic.png'), // Default image
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome to OneFX",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            NeumorphicButton(
              onPressed: () async {
                User? user = await _googleAuthController.signInWithGoogle();
                if (user != null) {
                  // If successful, navigate to another screen or show user details
                  Navigator.pushReplacementNamed(context, '/profile');
                } else {
                  // Handle error or cancellation here
                  print("Sign in failed or cancelled.");
                }
              },
              style: NeumorphicStyle(
                color: const Color(0xFF2C3252),
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login, color: Colors.white),
                  const SizedBox(width: 20),
                  const Text(
                    'Login with Google',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
