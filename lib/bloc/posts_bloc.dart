import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/post_model.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';
part 'posts_bloc.freezed.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  var posts = <PostModel>[];

  fetchApi() async {
    var res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(res.body);
    if (data != null) {
      data.forEach((v) => posts.add(PostModel.fromJson(v)));
      return posts;
    }
  }

  PostsBloc() : super(const _Initial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetPosts) {
        emit(const PostsState.loadingState());

        try {
          final posts = await fetchApi();
          emit(PostsState.loadedState(posts));
        } on Exception  {
          emit(const PostsState.errorState("Error Occured") );
        }
      }

      if(event is AddPosts){
        
      }
    });

  }
}
