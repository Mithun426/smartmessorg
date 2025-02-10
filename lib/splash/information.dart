import 'package:flutter/material.dart';

import '../login/mylogin.dart';
class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodPages(),
    );
  }
}

class FoodPages extends StatefulWidget {
  @override
  _FoodPagesState createState() => _FoodPagesState();
}

class _FoodPagesState extends State<FoodPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Large Heading Text
                  Text(
                    "The Taste \nOf Home",
                    style: TextStyle(
                      fontFamily: 'Merienda',
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Subheading Text
                  Text(
                    "Your favorite homely meals, \njust a tap away",
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Elevated Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
                          return LoginPage();
                        }) );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        minimumSize: Size(250, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        "Let's Start",
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
