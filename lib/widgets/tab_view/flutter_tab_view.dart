import 'package:flutter/material.dart';

class FlutterTabView extends StatefulWidget {
  const FlutterTabView({super.key});

  @override
  State<FlutterTabView> createState() => _FlutterTabViewState();
}

class _FlutterTabViewState extends State<FlutterTabView> {
  @override
  Widget build(BuildContext context)  {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
          backgroundColor: Colors.purple,
          title: Text("TabBar"),
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(80),
          //   child: Container(
          //     color: Colors.black26,
          //     child: Center(child: Text('Bottom')),
          //   ),
          // ),
          bottom: TabBar(
            labelColor: Colors.white,
            onTap: (value){
              print('page is change $value');
            },
            tabs: [
            Tab(text: 'Tab 1', icon: Icon(Icons.home) ),
            Tab(text: 'Tab 2',icon: Icon(Icons.star)),
            Tab(text: 'Tab 3',icon: Icon(Icons.percent)),
          ]),
        ),
        body: TabBarView(children: [
          Center(child: Text('Page 1', style: TextStyle(fontSize: 45,),),),
          Center(child: Text('Page 2', style: TextStyle(fontSize: 45),),),
          Center(child: Text('Page 3', style: TextStyle(fontSize: 45),),)
        ]),
      ),
    );
  }
}
