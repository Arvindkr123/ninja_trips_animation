import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  MyAnimatedContainer({super.key});

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  final random = Random();
  double boxHeight = 100;

  double boxWidth = 100;

  Color boxColor = Colors.deepPurple;

  BorderRadius _borderRadius = BorderRadius.circular(8);

  void _changeBoxSize() {
    setState(() {
      boxWidth = random.nextInt(400).toDouble();
      boxHeight = random.nextInt(400).toDouble();
    });
  }

  void _changeBoxColor() {
    setState(() {
      boxColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }

  void _changeBorderRadius() {
    setState(() {
      _borderRadius = BorderRadius.circular(random.nextInt(80).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: boxWidth,
          height: boxHeight,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: _changeBoxColor, icon: const Icon(Icons.palette)),
          IconButton(onPressed: _changeBorderRadius, icon: const Icon(Icons.interests)),
          IconButton(onPressed: _changeBoxSize, icon: const Icon(Icons.aspect_ratio)),
        ],
      ),
    );
  }
}
