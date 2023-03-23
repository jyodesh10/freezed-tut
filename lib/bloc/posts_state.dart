part of 'posts_bloc.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial() = _Initial;
  const factory PostsState.loadingState() = _Loading;
  const factory PostsState.loadedState(List<PostModel> posts) = _Loaded;
  const factory PostsState.errorState(String msg) = _Error;

}
