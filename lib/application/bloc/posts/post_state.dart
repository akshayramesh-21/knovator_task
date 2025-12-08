part of 'post_bloc.dart';

@freezed
class PostState with _$PostState {
  const PostState._(); // Private constructor for custom methods
  
  const factory PostState({
    required bool isLoading,
    required bool isError,
    required bool isSuccess,
    required List<PostModel> allPosts,
    @Default(false) bool isInitialized,
  }) = _PostState;

  // Factory method for initial state
  factory PostState.initial() {
    return const PostState(
      isLoading: false,
      isError: false,
      isSuccess: false,
      allPosts: [],
      isInitialized: false,
    );
  }
  
  // Method to check if a post is read
  bool isPostRead(int postId) {
    try {
      return allPosts.firstWhere((post) => post.id == postId).isRead;
    } catch (e) {
      return false;
    }
  }
  
  // Method to get remaining time for a post
  int getRemainingTime(int postId) {
    try {
      return allPosts.firstWhere((post) => post.id == postId).timerDuration;
    } catch (e) {
      return 0;
    }
  }
}