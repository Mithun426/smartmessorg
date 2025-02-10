import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'information.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FoodApp()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdfdfd),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("Smart Mess",
              style: TextStyle(
                    fontFamily: 'Sofia',
                    fontSize: 35,
                fontWeight: FontWeight.bold,
                  ),),
          ),
        Center(
          child: Lottie.asset(
            'assets/json/123.json',
            height: 150,
          ),
        ),
        ],
      )
    );
  }
}

