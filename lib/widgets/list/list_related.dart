import 'package:flutter/material.dart';

class ListRelated extends StatefulWidget {
  const ListRelated({super.key});

  @override
  State<ListRelated> createState() => _ListRelatedState();
}

class _ListRelatedState extends State<ListRelated> {
  List<String> items = List.generate(20, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List view Showcase')),

      // body: ListView.builder(
      //   itemCount: items.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(items[index]),
      //       onTap: () {
      //         showSnackbar('Tapped on ${items[index]}');
      //       },
      //     );
      //   },
      // ),
      // seperated list
      // body: ListView.separated(
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(items[index]),
      //     );
      //   },
      //   separatorBuilder: (context, index) {
      //     return const Divider();
      //   },
      //   itemCount: items.length,
      // ),
      body: RefreshIndicator(
        onRefresh: refreshList,
        child: ListView.builder(
          itemCount: items.length,
          // physics: const BouncingScrollPhysics(),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
              onTap: () {
                showSnackbar('Tapped on ${items[index]}');
              },
            );
          },
        ),
      ),
    );
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }

  Future<void> refreshList() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      items = List.generate(40, (index)=> 'Refreshed item $index');
    });
    showSnackbar('List refreshed');
  }
}
