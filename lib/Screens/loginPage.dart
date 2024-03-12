import 'package:business_exeperts/Services/googleAuth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,

      );
      // Handle successful login, you can navigate to another screen here
      print('Logged in user: ${userCredential.user!.email}');
      Navigator.pushNamed(context, "fromLogin");
    } catch (e) {
      // Handle login errors
      print('Login error: $e');
      // Show an alert dialog or snackbar to inform the user about the error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Error'),
            content: Text(
                'Failed to log in. Please check your credentials and try again.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
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

        child: Container(
          child: Column(

            children: [
              SizedBox(height: 100),

                Center(
                  child: Text(
                        "Welcome Back!",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),


                  ),
                ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                     Center(
                       child: GestureDetector(
                         onTap: (){},
                         child: Text(
                          "New here?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                                             ),
                       ),
                     ),

                  GestureDetector(
                    onTap: () {
                    Navigator.pushNamed(context, "fromLoginn");
                    },
                    child: Text(
                      " Create Account",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
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
                      hintText: "Email",
                      prefixIcon: Icon(Icons.mail, size: 30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
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
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, size: 30),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 17, 12, 0),
                        child: GestureDetector(
                          onTap: () {
                            // Forgot password logic here
                            Navigator.pushNamed(context, "forgotPage");
                          },
                          child: Text(
                            "Forgot?",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _login,
                child: Center(
                  child: Container(
                    height: 65,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.orange[300],
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Colors.white),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                    "or login with",
                    style: TextStyle(color: Colors.grey),
                  )),
              SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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

            ],
          ),
        ),
      ),

    );
  }
}