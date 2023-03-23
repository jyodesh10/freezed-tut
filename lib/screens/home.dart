import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/posts_bloc.dart';
import '../model/post_model.dart';
import '../model/user_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List randomNmame = ['ram', 'shyam', 'hari'];
  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          
          return state.when(initial:  (){
            return const CircularProgressIndicator();
          }, loadingState: (){
            return const CircularProgressIndicator();
          }, loadedState: (List<PostModel> posts){
            return ListView.builder(
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
          );
          }, errorState: (v){
          return Text(v.toString());
          });
          
        },
      ),
    );
  }
}
