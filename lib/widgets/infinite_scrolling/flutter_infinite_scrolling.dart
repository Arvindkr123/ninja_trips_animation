import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FlutterInfiniteScrolling extends StatefulWidget {
  const FlutterInfiniteScrolling({super.key});

  @override
  State<FlutterInfiniteScrolling> createState() =>
      _FlutterInfiniteScrollingState();
}

class _FlutterInfiniteScrollingState extends State<FlutterInfiniteScrolling> {
  List<String> items = ['item 1', 'item 2', 'item 3'];

  Future<void> refresh() async {
    setState(() {
      items.clear();
    });
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final res = await http.get(url);
    print(res);
    if (res.statusCode == 200) {
      final List newItems = json.decode(res.body);
      setState(() {
        items = newItems.map<String>((item) {
          final number = item['id'];
          return 'item $number';
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pull to Refresh list')),
      body: items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(title: Text(item));
                },
              ),
            ),
    );
  }
}
