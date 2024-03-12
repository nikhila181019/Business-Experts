import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'fromSplash');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Welcome to Business Exeperts",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 100),),
          ],
        ),
      ),
    );
  }
}

void main(){
  runApp(
    MaterialApp(
      home: SplashScreen(),
    )
  );
}