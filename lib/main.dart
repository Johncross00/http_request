import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = '';
  fetchData() async{
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);
    if(response.statusCode == 200){
      print("DATA FETCHED SUCCESSFULLY: ${response.body}");
      setState(() {
        _data = response.body;
      });
    }else{
      print("DATA FETCH FAILED: ${response.body}");
      setState(() {
        _data = "DATA FETCH FAILED";
      });
    }
  }
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
          ElevatedButton(onPressed: fetchData, child: Text("Fetch Data")),
          ElevatedButton(onPressed: (){}, child: Text("Create Data")),
          ElevatedButton(onPressed: (){}, child: Text("Delete Data")),
                ],
              ),
              Expanded(child: SingleChildScrollView(child: Text(_data)))
            ]
          )
        ),
      ),
    );
  }
}
