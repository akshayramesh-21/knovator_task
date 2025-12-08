import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:knovator_test/domain/all_posts/i_all_product_repo.dart';
import 'package:knovator_test/domain/all_posts/post_model/post_model.dart';

part 'post_bloc.freezed.dart';
part 'post_event.dart';
part 'post_state.dart';

const String _postsKey = 'cached_posts';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final IPostsRepo _iPostsRepo;
  final SharedPreferences _prefs;
  final Map<int, Timer> _timers = {};
  final Set<int> _pausedTimers = {}; // Track paused timers

  static const List<int> possibleDurations = [10, 20, 25]; // Possible timer durations in seconds

  PostBloc(this._iPostsRepo, this._prefs) : super(PostState.initial()) {
    on<_GetPosts>(_onGetPosts);
    on<_MarkAsRead>(_onMarkAsRead);
    on<_UpdateTimerDuration>(_onUpdateTimerDuration);
    on<_InitializeFromLocalStorage>(_onInitializeFromLocalStorage);
    on<_SaveToLocalStorage>(_onSaveToLocalStorage);
    on<_PauseTimer>(_onPauseTimer);
    on<_ResumeTimer>(_onResumeTimer);
    on<_PauseAllTimers>(_onPauseAllTimers);
    on<_ResumeAllTimers>(_onResumeAllTimers);

    // Initialize from local storage when the bloc is created
    add(const PostEvent.initializeFromLocalStorage());
  }

  @override
  Future<void> close() {
    // Cancel all timers when the bloc is closed
    for (var timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    return super.close();
  }

  Future<void> _onGetPosts(_GetPosts event, Emitter<PostState> emit) async {
    try {
      // Emit loading state
      emit(state.copyWith(
        isLoading: true,
        isError: false,
        isSuccess: false,
      ));

      // Call the repository to get all posts
      final result = await _iPostsRepo.getPostsData();

      // Handle the result
      await result.fold(
        (failure) {
          emit(state.copyWith(
            isLoading: false,
            isError: true,
            isSuccess: false,
          ));
        },
        (posts) async {
          // Merge with existing posts to preserve read status and timer values
          final updatedPosts = _mergeWithExistingPosts(posts);

          // Start timers for visible posts
          _initializeTimers(updatedPosts);

          emit(state.copyWith(
            isLoading: false,
            isError: false,
            isSuccess: true,
            allPosts: updatedPosts,
          ));

          // Save to local storage
          add(const PostEvent.saveToLocalStorage());
        },
      );
    } catch (e) {
      log('Error in _onGetPosts: $e');
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        isSuccess: false,
      ));
    }
  }

  void _onMarkAsRead(_MarkAsRead event, Emitter<PostState> emit) {
    final updatedPosts = state.allPosts.map((post) {
      if (post.id == event.postId) {
        // Cancel the timer when post is marked as read
        _cancelTimer(event.postId);
        return post.copyWithReadStatus(true);
      }
      return post;
    }).toList();

    emit(state.copyWith(allPosts: updatedPosts));
    add(const PostEvent.saveToLocalStorage());
  }

  void _onUpdateTimerDuration(_UpdateTimerDuration event, Emitter<PostState> emit) {
    final updatedPosts = state.allPosts.map((post) {
      if (post.id == event.postId) {
        return post.copyWithTimerDuration(event.duration);
      }
      return post;
    }).toList();

    emit(state.copyWith(allPosts: updatedPosts));
  }

  Future<void> _onInitializeFromLocalStorage(
    _InitializeFromLocalStorage event,
    Emitter<PostState> emit,
  ) async {
    try {
      final jsonString = _prefs.getString(_postsKey);
      if (jsonString != null) {
        final List<dynamic> jsonList = json.decode(jsonString);
        final posts = jsonList
            .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
            .toList();

        // Start timers for the loaded posts
        _initializeTimers(posts);

        emit(state.copyWith(
          allPosts: posts,
          isSuccess: true,
        ));
      }

      // Always try to fetch fresh data in the background
      add(const PostEvent.getPosts());
    } catch (e) {
      // If there's an error with local storage, just fetch from network
      add(const PostEvent.getPosts());
    }
  }

  Future<void> _onSaveToLocalStorage(
    _SaveToLocalStorage event,
    Emitter<PostState> emit,
  ) async {
    try {
      final jsonList = state.allPosts.map((post) => post.toJson()).toList();
      await _prefs.setString(_postsKey, json.encode(jsonList));
    } catch (e) {
      log('Error saving to local storage: $e');
    }
  }

  List<PostModel> _mergeWithExistingPosts(List<PostModel> newPosts) {
    final existingPosts = Map.fromIterable(
      state.allPosts,
      key: (post) => post.id,
      value: (post) => post,
    );

    return newPosts.map((post) {
      final existingPost = existingPosts[post.id];
      if (existingPost != null) {
        // Preserve read status and timer duration from existing post
        return post.copyWith(
          isRead: existingPost.isRead,
          timerDuration: existingPost.timerDuration,
        );
      }
      // For new posts, assign a random timer duration
      return post.copyWith(
        timerDuration: possibleDurations[DateTime.now().millisecondsSinceEpoch % possibleDurations.length],
      );
    }).toList();
  }

  void _initializeTimers(List<PostModel> posts) {
    // Cancel existing timers
    for (var timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();

    // Create new timers for posts that need them
    for (final post in posts) {
      if (!post.isRead) {
        _startTimerForPost(post);
      }
    }
  }

  void _startTimerForPost(PostModel post) {
    if (post.isRead || post.timerDuration <= 0) return;

    _timers[post.id!] = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentDuration = state.allPosts
          .firstWhere((p) => p.id == post.id, orElse: () => post)
          .timerDuration;

      if (currentDuration <= 1) {
        // Timer finished, mark as read
        add(PostEvent.markAsRead(post.id!));
        timer.cancel();
        _timers.remove(post.id);
      } else {
        // Update timer duration
        add(PostEvent.updateTimerDuration(
          postId: post.id!,
          duration: currentDuration - 1,
        ));
      }
    });
  }

  void _cancelTimer(int postId) {
    _timers[postId]?.cancel();
    _timers.remove(postId);
    _pausedTimers.remove(postId);
  }

  void _onPauseTimer(_PauseTimer event, Emitter<PostState> emit) {
    final postId = event.postId;
    if (_timers.containsKey(postId) && !_pausedTimers.contains(postId)) {
      _timers[postId]?.cancel();
      _timers.remove(postId);
      _pausedTimers.add(postId);
    }
  }

  void _onResumeTimer(_ResumeTimer event, Emitter<PostState> emit) {
    final postId = event.postId;
    if (_pausedTimers.contains(postId)) {
      _pausedTimers.remove(postId);
      final post = state.allPosts.firstWhere(
        (p) => p.id == postId,
        orElse: () => PostModel(userId: null, title: null, id: null, body: null),
      );
      if (post.id != null && !post.isRead && post.timerDuration > 0) {
        _startTimerForPost(post);
      }
    }
  }

  void _onPauseAllTimers(_PauseAllTimers event, Emitter<PostState> emit) {
    // Pause all active timers (used when navigating away)
    for (var entry in _timers.entries.toList()) {
      entry.value.cancel();
      _pausedTimers.add(entry.key);
    }
    _timers.clear();
  }

  void _onResumeAllTimers(_ResumeAllTimers event, Emitter<PostState> emit) {
    // Resume all paused timers (used when coming back to list)
    for (var postId in _pausedTimers.toList()) {
      final post = state.allPosts.firstWhere(
        (p) => p.id == postId,
        orElse: () => PostModel(userId: null, title: null, id: null, body: null),
      );
      if (post.id != null && !post.isRead && post.timerDuration > 0) {
        _startTimerForPost(post);
      }
    }
    _pausedTimers.clear();
  }
}
