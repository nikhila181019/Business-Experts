import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    final TextEditingController _emailController = TextEditingController();

    Future<void> _sendPasswordResetEmail(String email) async {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        // Show a success message or navigate to another screen if needed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password reset email sent successfully!"),
          ),
        );
      } on FirebaseAuthException catch (e) {
        print("Firebase Auth Error: ${e.code} - ${e.message}");
        // Handle specific FirebaseAuthException errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error sending password reset email: ${e.message}"),
          ),
        );
      } catch (e) {
        print("Error sending password reset email: $e");
        // Handle other errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error sending password reset email: $e"),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Text(
                "Business Experts",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Forgot Password?",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Remember your password?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "fromSignup");
                  },
                  child: Text(
                    " Login",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(04, 04, 0, 0),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Email",
                      prefixIcon: Icon(
                        Icons.mail,
                        size: 30,
                      )),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                if (_emailController.text.isNotEmpty) {
                  _sendPasswordResetEmail(_emailController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter an email address"),
                    ),
                  );
                }
              },
              child: Container(
                height: 65,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Text(
                  "Send Code",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


