import 'package:flutter/material.dart';

class FlutterExpansionTile extends StatelessWidget {
  const FlutterExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expansion Tile widget')),
      body: ExpansionTile(
        title: Text(
          'Animals',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        children: [
          ListTile(
            onTap: () {
              
            },
            title: Text(
              'Dog',
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              
            },
            title: Text(
              'Cat',
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              
            },
            title: Text(
              'Cows',
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              
            },
            title: Text(
              'Rats',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
        onExpansionChanged: (value) {
          print('is exapnsion change $value');
        },
      ),
    );
  }
}
