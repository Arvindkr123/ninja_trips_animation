import 'package:flutter/material.dart';

class FlutterBottomSheet extends StatefulWidget {
  const FlutterBottomSheet({super.key});

  @override
  State<FlutterBottomSheet> createState() => _FlutterBottomSheetState();
}

class _FlutterBottomSheetState extends State<FlutterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom sheet')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlutterLogo(size: 120),
                    FlutterLogo(size: 120),
                    FlutterLogo(size: 120),
                    FlutterLogo(size: 120),
                    ElevatedButton(
                      onPressed: () {
                        return Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text('open Bottom sheet'),
        ),
      ),
    );
  }
}
