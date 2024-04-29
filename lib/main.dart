import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HTTP REQUEST"),
      centerTitle: true,),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
          ElevatedButton(onPressed: (){}, child: Text("Fetch Data")),
          ElevatedButton(onPressed: (){}, child: Text("Create Data")),
          ElevatedButton(onPressed: (){}, child: Text("Delete Data")),
                ],
              ),
              Expanded(child: SingleChildScrollView(child: Text("DATA WILL BE HERE")))
            ]
          )
        ),
      ),
    );
  }
}
