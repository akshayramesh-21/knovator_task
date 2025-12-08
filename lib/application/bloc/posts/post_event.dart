part of 'post_bloc.dart';

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
  
  // Pause timer for a specific post (when scrolled out of view)
  const factory PostEvent.pauseTimer(int postId) = _PauseTimer;
  
  // Resume timer for a specific post (when scrolled back into view)
  const factory PostEvent.resumeTimer(int postId) = _ResumeTimer;
  
  // Pause all timers (when navigating to detail screen)
  const factory PostEvent.pauseAllTimers() = _PauseAllTimers;
  
  // Resume all timers (when coming back from detail screen)
  const factory PostEvent.resumeAllTimers() = _ResumeAllTimers;
}
