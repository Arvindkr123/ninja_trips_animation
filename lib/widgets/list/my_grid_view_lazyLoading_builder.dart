import 'package:flutter/material.dart';

class MyGridViewLazyloadingBuilder extends StatelessWidget {
  const MyGridViewLazyloadingBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View with Loading')),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, index) {
          return FutureBuilder(
            future: fetchData(index),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Placeholder();
              }
              return GestureDetector(
                onTap: () {},
                child: GridTile(
                  header: Center(
                    child: Text(
                      'header $index',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  footer: Center(
                    child: Text(
                      'footer $index',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  child: Container(
                    color: Colors.blue.shade600,
                    child: Center(
                      child: Text(
                        'item $index',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<String> fetchData(int index)async {
    await Future.delayed(Duration(seconds: 2));
    return 'item $index';
  }
}
