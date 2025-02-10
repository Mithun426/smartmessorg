import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smartmess/widgets/Text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController fooditem = TextEditingController();
  String _greeting = '';
  late Timer _timer;
  final List<String> imagePaths = [
    'assets/images/img1.jpeg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
  ];
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _updateGreeting();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _updateGreeting();
    });
  }

  void _updateGreeting() {
    setState(() {
      _greeting = getGreeting();
    });
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orangeAccent,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _greeting,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'Merienda',
                    fontSize: 25,
                    color: Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Meals picked for today!",
                  style: Mytext.boldTextFieldStyle()
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: fooditem,
                  decoration: InputDecoration(
                    hintText: 'Search available food items',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CarouselSlider.builder(
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(imagePaths[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 195.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 700),
                  viewportFraction: 0.83,
                  onPageChanged: (index, reason) {
                    _currentPageNotifier.value = index;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ValueListenableBuilder<int>(
                  valueListenable: _currentPageNotifier,
                  builder: (context, currentPage, _) {
                    return AnimatedSmoothIndicator(
                      activeIndex: currentPage,
                      count: imagePaths.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Colors.orangeAccent,
                        dotColor: Colors.grey.shade300,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
