import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_tut/post_model.dart';
import 'package:freezed_tut/user_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List randomNmame = ['ram', 'shyam', 'hari'];
  @override
  void initState() {
    fetchApi();
    super.initState();
  }

  updateDetail(index) {
    int r = Random().nextInt(randomNmame.length);
    var name = '';
    switch (r) {
      case 0:
        name = randomNmame[0];
        break;
      case 1:
        name = randomNmame[1];
        break;
      case 2:
        name = randomNmame[2];
        break;
      default:
    }
    userList[index] = userList[index].copyWith(firstName: name);
    setState(() {});
  }

  var posts = <PostModel>[];

  fetchApi() async {
    var res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(res.body);
    if (data != null) {
      data.forEach((v) => posts.add(PostModel.fromJson(v)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              updateDetail(index);
            },
            title: Text(posts[index].title.toString()),
            subtitle: Text(posts[index].body.toString()),
           
          );
        },
      ),
    );
  }
}
