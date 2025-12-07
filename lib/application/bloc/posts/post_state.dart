import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:knovator_test/domain/all_posts/post_model/post_model.dart';

part 'post_state.freezed.dart';
part 'post_state.g.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    required bool isLoading,
    required bool isError,
    required bool isSuccess,
    required List<PostModel> allPosts,
    @Default(false) bool isInitialized,
  }) = _PostState;

  // Factory method for initial state
  factory PostState.initial() => const PostState(
        isLoading: false,
        isError: false,
        isSuccess: false,
        allPosts: [],
      );
}