import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: (
              Column(

                children: [
                  SizedBox(height: 280,),

                  Image.asset("assets/AllDone/AllDoneIcon.png"),
                  SizedBox(height: 260,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "fromOnBoarding");
                    },
                    child: Container(
                      height: 65,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.orange[300],
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                          child: Text(
                            "Got it!",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: Colors.white),
                          )),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
