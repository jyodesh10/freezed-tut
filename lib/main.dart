import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_tut/bloc/posts_bloc.dart';
import 'package:freezed_tut/screens/home.dart';

import 'cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (BuildContext context) =>
              PostsBloc()..add(const PostsEvent.getPosts()),
        ),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit())
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.isDark ? ThemeData.dark(): ThemeData.light(),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
