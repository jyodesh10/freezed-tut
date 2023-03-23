import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_tut/bloc/posts_bloc.dart';
import 'package:freezed_tut/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
providers: [
  BlocProvider<PostsBloc>(create:  (BuildContext context) => PostsBloc()..add(const PostsEvent.getPosts()),)
],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const MyHomePage(),
      ),
    );
  }
}
