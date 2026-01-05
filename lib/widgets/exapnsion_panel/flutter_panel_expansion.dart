import 'package:flutter/material.dart';

class FlutterPanelExpansion extends StatefulWidget {
  const FlutterPanelExpansion({super.key});

  @override
  State<FlutterPanelExpansion> createState() => _FlutterPanelExpansionState();
}

class _FlutterPanelExpansionState extends State<FlutterPanelExpansion> {
  static const lorem =
      """There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.""";

  final List<Item> items = [
    Item(header: 'Panel 1', body: lorem),
    Item(header: 'Panel 2', body: lorem),
    Item(header: 'Panel 3', body: lorem),
    Item(header: 'Panel 4', body: lorem),
    Item(header: 'Panel 5', body: lorem),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Panel Expansion')),
      body: SingleChildScrollView(
        // child: ExpansionPanelList.radio(
        //   children: items
        //       .map(
        //         (item) => ExpansionPanelRadio(
        //           canTapOnHeader: true,
        //           value: item.header,
        //           headerBuilder: (context, isExpanded) => ListTile(
        //             title: Text(item.header, style: TextStyle(fontSize: 20)),
        //           ),
        //           body: ListTile(
        //             title: Text(item.body, style: TextStyle(fontSize: 20)),
        //           ),
        //         ),
        //       )
        //       .toList(),
        // ),
        //   child: ExpansionPanelList(
        //     expansionCallback: (index, isExpanded) {
        //       setState(() => items[index].isExpanded = !isExpanded);
        //     },
        //     children: items
        //         .map(
        //           (item) => ExpansionPanel(
        //             canTapOnHeader: true,
        //             isExpanded: item.isExpanded,
        //             headerBuilder: (context, isExpanded) => ListTile(
        //               title: Text(item.header, style: TextStyle(fontSize: 20)),
        //             ),
        //             body: ListTile(
        //               title: Text(item.body, style: TextStyle(fontSize: 20)),
        //             ),
        //           ),
        //         )
        //         .toList(),
        //   ),
        // ),
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() {
              items[index].isExpanded = isExpanded;
              print('${items[index].header}, ${items[index].isExpanded}');
            });
          },
          children: items.map((item) {
            return ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: item.isExpanded,
              headerBuilder: (context, isExpanded) => ListTile(
                title: Text(item.header, style: TextStyle(fontSize: 20)),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(item.body, style: TextStyle(fontSize: 16)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Item {
  final String header;
  final String body;
  bool isExpanded;
  Item({required this.header, required this.body, this.isExpanded = false});
}
