import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    // Trigger the authentication flow
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the credential
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Show a Snackbar indicating successful login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login successful"),
          backgroundColor: Colors.green,
        ),
      );
      // Redirect user to the desired page after successful login
      Navigator.pushNamed(context, "fromLoginn");
    } else {
      // User canceled Google sign-in
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Google sign-in canceled"),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    print("Error signing in with Google: $e");
    // Show a Snackbar indicating an error occurred during login
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error signing in with Google: $e"),
          backgroundColor: Colors.red,
        ),
    );
  }
}
