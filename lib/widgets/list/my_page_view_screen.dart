import 'package:flutter/material.dart';
import 'dart:math';
class MyPageViewScreen extends StatefulWidget {
  const MyPageViewScreen({super.key});

  @override
  State<MyPageViewScreen> createState() => _MyPageViewScreenState();
}

class _MyPageViewScreenState extends State<MyPageViewScreen> {
  late PageController _pageController;
  int pageIndex = 0;

  final Random _random = Random();

  late final List<Color> pageColors;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    pageColors = List.generate(
      8,
      (_) => Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> pages = List.generate(
    8,
    (index) => Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Page ${index + 1}',
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    ),
  );

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Color Pages')),
      body: PageView.builder(
        controller: _pageController,
        itemCount: pageColors.length,
        itemBuilder: (context, index) {
          return Container(
            color: pageColors[index],
            child: Center(
              child: Text(
                'Page ${index + 1}',
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
