import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _margin = 50;
                });
              },
              child: Text('Animate Margin'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _color = Colors.redAccent;
                });
              },
              child: Text('Animate color'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _width = sizeWidth;
                });
              },
              child: Text('Animate width'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _opacity = 0;
                });
              },
              child: Text('Animate opacity'),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 2),
              child: Text('hide me', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _opacity = 1;
                  _margin = 0;
                  _width = 200;
                  _color = Colors.blue;
                });
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
