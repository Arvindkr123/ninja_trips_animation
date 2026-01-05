import 'package:flutter/material.dart';

class FlutterPopupDialog extends StatefulWidget {
  const FlutterPopupDialog({super.key});

  @override
  State<FlutterPopupDialog> createState() => _FlutterPopupDialogState();
}

class _FlutterPopupDialogState extends State<FlutterPopupDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popup dialog widget')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('My Title'),
                  content: Text(
                    'lorem lasdf asdfasdfasd asdf asdf asdfasdfasdf asdf asdf asdfa sdfasdfasdfasdfasdfasdfdsafasdfasdfasdfasdfasdfa asdf asdf asdf asdf asdf asdf asdfadfa sdfkasdf adfasdfadf asdfasdfasdfsa asdfasdf asdfas dfas fadf asdfa sdfasdf asdfasdfasdf asfdas dfdas',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Open'),
        ),
      ),
    );
  }
}
