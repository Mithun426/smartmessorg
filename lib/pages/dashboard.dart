import 'package:bubble_navigation_bar/bubble_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartmess/pages/payment.dart';
import 'package:smartmess/pages/profile.dart';

import 'food.dart';
import 'home.dart';

class Myfoodpage extends StatefulWidget {
  const Myfoodpage({super.key});

  @override
  State<Myfoodpage> createState() => _MyfoodpageState();
}

class _MyfoodpageState extends State<Myfoodpage> {
  final _pageController = PageController();
  int _index = 0;
  List<Widget> pages=[
    Home(),
    Food(),
    Payment(),
    Profile(),
  ];
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _index = _pageController.page!.round();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Home(),
          Food(),
          Payment(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BubbleNavigationBar(
        currentIndex: _index,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.orange.shade200,
        onIndexChanged: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 240),
            curve: Curves.decelerate,
          );
        },
        items: const [
          BubbleNavItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BubbleNavItem(
            icon: Icon(Icons.fastfood_outlined),
            label: 'Food',
          ),
          BubbleNavItem(
            icon: Icon(Icons.payment_rounded),
            label: 'Payment',
          ),
          BubbleNavItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}