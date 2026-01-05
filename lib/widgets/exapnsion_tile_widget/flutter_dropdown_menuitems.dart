import 'package:flutter/material.dart';

class FlutterDropdownMenuitems extends StatefulWidget {
  const FlutterDropdownMenuitems({super.key});

  @override
  State<FlutterDropdownMenuitems> createState() =>
      _FlutterDropdownMenuitemsState();
}

class _FlutterDropdownMenuitemsState extends State<FlutterDropdownMenuitems> {
  List<String> items = ['item 1', 'item 2', 'item 3', 'item 4', 'item 5'];
  String? selectedItem = 'item 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown Menu widget')),
      // body: Center(
      //   child: SizedBox(
      //     width: 240,
      //     child: DropdownButton<String>(
      //       value: selectedItem, // ✅ required
      //       items: items.map((menu) {
      //         return DropdownMenuItem<String>(
      //           value: menu,
      //           child: Text(
      //             menu,
      //             style: const TextStyle(fontSize: 24),
      //           ),
      //         );
      //       }).toList(),
      //       onChanged: (value) {
      //         setState(() {
      //           selectedItem = value;
      //         });
      //       },
      //     ),
      //   ),
      // ),
      body: Center(
        child: SizedBox(
          width: 240,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 3, color: Colors.green),
              ),
              enabled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 3, color: Colors.black),
              ),
            ),
            value: selectedItem, // ✅ required
            items: items.map((menu) {
              return DropdownMenuItem<String>(
                value: menu,
                child: Text(menu, style: const TextStyle(fontSize: 16)),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedItem = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
