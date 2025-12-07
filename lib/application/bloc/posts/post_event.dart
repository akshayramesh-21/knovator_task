
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:knovator_test/domain/all_posts/post_model/post_model.dart';

part 'post_event.freezed.dart';
part 'post_event.g.dart';

@freezed
class PostEvent with _$PostEvent {
  // Fetch posts from API
  const factory PostEvent.getPosts() = GetPosts;
  
  // Mark a post as read
  const factory PostEvent.markAsRead(int postId) = MarkAsRead;
  
  // Update timer duration for a post
  const factory PostEvent.updateTimerDuration({
    required int postId,
    required int duration,
  }) = UpdateTimerDuration;
  
  // Initialize posts from local storage
  const factory PostEvent.initializeFromLocalStorage() = InitializeFromLocalStorage;
  
  // Save posts to local storage
  const factory PostEvent.saveToLocalStorage() = SaveToLocalStorage;

  factory PostEvent.fromJson(Map<String, dynamic> json) => _$PostEventFromJson(json);
}
