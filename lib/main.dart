import 'package:business_exeperts/Screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/forgotPasswordPage.dart';
import 'Screens/homePage.dart';
import 'Screens/loginPage.dart';
import 'Screens/signUpPage.dart';
import 'Screens/verifyOtpPage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(

        apiKey: "AIzaSyChB8BlIWRlOv6bJNI36qTtY6m69zxw4so",
        messagingSenderId: "787049616697",
        appId: "1:787049616697:web:f5a9539ab6a7077f69c4e8",
        projectId: "businessexeperts",

      )

  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LoginPage(),

      routes: {
        "fromLogin":(context)=>HomePage(),
        "fromForgotPassword":(context)=>VerifyOtp(),
        "fromWelcomePage":(context)=>HomePage(),
        "fromLoginn":(context)=>WelcomePage(),
        "fromSignup":(context)=>LoginPage(),
        "forgotPage":(context)=>ForgotPassword(),
      },
    );
  }
}
