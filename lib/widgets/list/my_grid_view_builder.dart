import 'package:flutter/material.dart';

class MyGridViewBuilder extends StatelessWidget {
  const MyGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View Show case')),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {},
            child: GridTile(
              header: Center(child: Text('header $index', style: TextStyle(fontSize: 12))),
              footer: Center(child: Text('footer $index', style: TextStyle(fontSize: 12))),
              child: Container(
                color: Colors.blue.shade600,
                child: Center(
                  child: Text('item $index', style: TextStyle(fontSize: 24)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
