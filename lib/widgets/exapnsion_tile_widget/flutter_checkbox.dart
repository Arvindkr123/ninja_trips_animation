import 'package:flutter/material.dart';

class FlutterCheckbox extends StatefulWidget {
  const FlutterCheckbox({super.key});

  @override
  State<FlutterCheckbox> createState() => _FlutterCheckboxState();
}

class _FlutterCheckboxState extends State<FlutterCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkbox in Flutter')),
      // body: Center(
      //   child: Theme(
      //     data: Theme.of(context).copyWith(
      //       unselectedWidgetColor: Colors.black12
      //     ),
      //     child: Checkbox(
      //       value: isChecked,
      //       onChanged: (value) {
      //         setState(() {
      //           isChecked = value!;
      //         });
      //       },
      //       activeColor: Colors.red,
      //       checkColor: Colors.white,
      //     ),
      //   ),
      // ),
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.black12
          ),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Title'),
            subtitle: Text('subtitle'),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
            activeColor: Colors.red,
            checkColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
