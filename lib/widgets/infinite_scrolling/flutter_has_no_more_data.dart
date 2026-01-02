import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FlutterHasNoMoreData extends StatefulWidget {
  const FlutterHasNoMoreData({super.key});

  @override
  State<FlutterHasNoMoreData> createState() => _FlutterHasNoMoreDataState();
}

class _FlutterHasNoMoreDataState extends State<FlutterHasNoMoreData> {
  final controller = ScrollController();
  List<String> items = [];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetch();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;
    const limit = 25;
    final url = Uri.parse(
      "https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page",
    );
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final List newItems = json.decode(res.body);
      setState(() {
        page++;
        isLoading = false;
        if (newItems.length < limit) {
          hasMore = false;
        }
        items.addAll(
          newItems.map<String>((item) {
            return 'item ${item['id']}';
          }).toList(),
        );
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      page = 0;
      hasMore = false;
      items.clear();
    });
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('INFINITE SCROLL LIST VIEW')),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
          controller: controller,
          padding: const EdgeInsets.all(8),
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index < items.length) {
              final item = items[index];
              return ListTile(title: Text(item));
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: hasMore
                    ? Center(child: CircularProgressIndicator())
                    : Center(child: Text('No more data to load')),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refresh,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
