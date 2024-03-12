import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Services/googleAuth.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;


  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // If signup successful, you can navigate to another page or perform any action here.
      print("Signup successful: ${userCredential.user!.uid}");
      // Navigate to another page after signup
      Navigator.pushNamed(context, "fromLogin");
    } catch (e) {
      print("Error during signup: $e");
      // Handle errors here, like showing a snackbar or dialog with error message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error during signup: $e"),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
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
                "Business Exeperts",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),

                     Center(
                       child: Text(
                        "Signup 1 of 1",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                                           ),
                     ),


                 Center(
                   child: Text(
                          "Welcome!",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),



                                   ),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    SizedBox(width: 40),
                    GestureDetector(
                      onTap: (){
                        signInWithGoogle(context);
                      },
                      child: Container(
                        height: 70,
                        width: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/Icons/GoogleIcon.png")),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      height: 70,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Icons/AppleIcon.png")),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      height: 70,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Icons/FacebookIcon.png")),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                    child: TextFormField(
                      //controller: fullNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Full Name",
                          prefixIcon: Icon(
                            Icons.person,
                            size: 30,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                    child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },

                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email Address",
                          prefixIcon: Icon(
                            Icons.mail,
                            size: 30,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                    child: TextFormField(
                      //controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Phone';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                          prefixIcon: Icon(
                            Icons.phone,
                            size: 30,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                    child: TextFormField(
                      //controller: passwordController,
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 30,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                    child: TextFormField(
                      //controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Confirm';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Re-enter Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 30,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                       GestureDetector(
                        onTap: () {
                         Navigator.pushNamed(context, "fromSignUp");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, "fromSignup");
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),


                       GestureDetector(
                         onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _signUp();
                          }

                        },
                        child: Container(
                          height: 65,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.orange[300],
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                    color: Colors.white),
                              )),
                        ),
                      ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
