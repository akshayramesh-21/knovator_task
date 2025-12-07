
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:knovator_test/domain/all_posts/post_model/post_model.dart';

part 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  // Fetch posts from API
  const factory PostEvent.getPosts() = _GetPosts;
  
  // Mark a post as read
  const factory PostEvent.markAsRead(int postId) = _MarkAsRead;
  
  // Update timer duration for a post
  const factory PostEvent.updateTimerDuration({
    required int postId,
    required int duration,
  }) = _UpdateTimerDuration;
  
  // Initialize posts from local storage
  const factory PostEvent.initializeFromLocalStorage() = _InitializeFromLocalStorage;
  
  // Save posts to local storage
  const factory PostEvent.saveToLocalStorage() = _SaveToLocalStorage;
}
