import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  Future<void> fetchData() async{
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);
    if(response.statusCode == 200 || response.statusCode ==201){
      setState(() {
        _data ="DATA FETCHED SUCCESSFULLY {response.body}";
      });
    }else{
      setState(() {
        _data = "DATA FETCH FAILED";
      });
    }
  }

  Future<void> createData() async{
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.post(url, body: {
      "title": "foo",
      "body": "bar",
      "userId": "1"
    });

    if(response.statusCode == 200 || response.statusCode ==201){
      setState(() {
        _data ="DATA CREATE SUCCESSFULLY {response.body}";
      });
    }else{
      setState(() {
        _data = "DATA CREATION FAILED {response.body}";
      });
    }
  }

  Future<void> deleteData() async{
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/102");
    var response = await http.delete(url);
    if(response.statusCode == 200 || response.statusCode ==201){
      setState(() {
        _data ="DATA DROP SUCCESSFULLY";
      });
    }else{
      setState(() {
        _data = "DATA DROP FAILED {response.body}";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HTTP REQUEST"),
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
          ElevatedButton(onPressed: fetchData, child: const Text("Fetch Data")),
          ElevatedButton(onPressed: createData, child: const Text("Create Data")),
          ElevatedButton(onPressed: deleteData, child: const Text("Delete Data")),
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
