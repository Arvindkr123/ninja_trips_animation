import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IncrmentIntent extends Intent {
  const IncrmentIntent();
}

class DecrmentIntent extends Intent {
  const DecrmentIntent();
}

class FlutterActionsAndShortcuts extends StatefulWidget {
  const FlutterActionsAndShortcuts({super.key, required this.title});
  final String title;

  @override
  State<FlutterActionsAndShortcuts> createState() =>
      _FlutterActionsAndShortcutsState();
}

class _FlutterActionsAndShortcutsState
    extends State<FlutterActionsAndShortcuts> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Shortcuts(
          shortcuts: const <ShortcutActivator, Intent>{
            SingleActivator(LogicalKeyboardKey.arrowUp): IncrmentIntent(),
            SingleActivator(LogicalKeyboardKey.arrowDown): DecrmentIntent(),
          },
          child: Actions(
            actions: {
              IncrmentIntent: CallbackAction<IncrmentIntent>(
                onInvoke: (intent) => setState(() {
                  count = count + 1;
                }),
              ),
              DecrmentIntent: CallbackAction<DecrmentIntent>(
                onInvoke: (intent) => setState(() {
                  count = count - 1;
                }),
              ),
            },
            child: Focus(
              autofocus: true,
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Text('add the counter by pressing the arrow up key'),
                  const SizedBox(height: 30,),
                  Text('And'),
                  const SizedBox(height: 30,),
                  Text('subtract the counter by pressing the arrow down key'),
                  const SizedBox(height: 50,),
                  Text('$count', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
