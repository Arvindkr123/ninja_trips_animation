import 'package:flutter/material.dart';

class MyFutureBuilder extends StatelessWidget {
  const MyFutureBuilder({super.key});

  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Hello, FutureBuilder';
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text('Future builder case'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchData(), 
          builder: (context, snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('Press button to start');
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                if(snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                }else{
                  return Text('Data: ${snapshot.data}');
                }
              default:
                return Container();
            }
          }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.refresh),)
    );
  }
}
