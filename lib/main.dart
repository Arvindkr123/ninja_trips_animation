import 'package:flutter/material.dart';
import 'package:ninja_trips/widgets/exapnsion_panel/flutter_panel_expansion.dart';
import 'package:ninja_trips/widgets/tab_view/flutter_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Ninja Trips',
    //   debugShowCheckedModeBanner: false,
    //   home: Home(),
    // );

    return MaterialApp(
      title: 'Flutter Widgets',
      debugShowCheckedModeBanner: false,
      home: FlutterTabView(),
    );
  }
}
