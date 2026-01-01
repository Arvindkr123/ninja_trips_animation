import 'package:flutter/material.dart';
import 'package:ninja_trips/widgets/list/list_related.dart';
import 'package:ninja_trips/widgets/list/my_future_builder.dart';
import 'package:ninja_trips/widgets/list/my_grid_view_builder.dart';
import 'package:ninja_trips/widgets/list/my_grid_view_lazyLoading_builder.dart';
import 'package:ninja_trips/widgets/list/my_page_view_screen.dart';
import 'package:ninja_trips/widgets/my_animated_container.dart';
import 'package:ninja_trips/widgets/actions_short_cut/flutter_actions_and_shortcuts.dart';
import 'screens/home.dart';

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
      home: FlutterActionsAndShortcuts(title: 'Flutter Shortcuts and Actions'),
    );
  }
}
