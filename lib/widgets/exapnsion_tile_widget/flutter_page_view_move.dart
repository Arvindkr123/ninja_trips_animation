import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FlutterPageViewMove extends StatefulWidget {
  const FlutterPageViewMove({super.key});

  @override
  State<FlutterPageViewMove> createState() => _FlutterPageViewMoveState();
}

class _FlutterPageViewMoveState extends State<FlutterPageViewMove> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page View'),
        actions: [
          IconButton(
            onPressed: () => controller.previousPage(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          IconButton(
            onPressed: () => controller.nextPage(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            icon: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          print('Page ${value + 1}');
        },
        controller: controller,
        children: [
          Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Page 1',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Page 2',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Center(
              child: Text(
                'Page 3',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Colors.deepOrange,
            child: Center(
              child: Text(
                'Page 4',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
