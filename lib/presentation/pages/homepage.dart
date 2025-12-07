


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator_test/application/bloc/posts/post_bloc.dart';
import 'package:knovator_test/application/bloc/posts/post_event.dart';
import 'package:knovator_test/domain/all_posts/post_model/post_model.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final Set<int> _visibleItems = {};
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  void _onScroll() {
    // This would be used to track visible items for timer pausing/resuming
    // Implementation would depend on how you want to handle visibility
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state.isLoading && state.allPosts.isEmpty) {
            return _buildLoadingShimmer();
          }
          
          if (state.isError && state.allPosts.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Failed to load posts'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<PostBloc>().add(const PostEvent.getPosts()),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.allPosts.length,
            itemBuilder: (context, index) {
              final post = state.allPosts[index];
              return _PostItem(post: post);
            },
          );
        },
      ),
    );
  }
  
  Widget _buildLoadingShimmer() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PostItem extends StatelessWidget {
  final PostModel post;
  
  const _PostItem({required this.post});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2.0,
      color: post.isRead ? Colors.white : const Color(0xFFF5F9FF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: post.isRead ? Colors.grey.shade200 : const Color(0xFFE3F2FD),
          width: 1.0,
        ),
      ),
      child: InkWell(
        onTap: () {
          if (!post.isRead) {
            context.read<PostBloc>().add(PostEvent.markAsRead(post.id!));
          }
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post number/avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: post.isRead ? Colors.grey.shade200 : const Color(0xFFE3F2FD),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${post.id}',
                    style: TextStyle(
                      color: post.isRead ? Colors.grey : const Color(0xFF1976D2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              // Post content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title ?? 'No Title',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: post.isRead ? Colors.grey.shade700 : Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      post.body ?? 'No content',
                      style: TextStyle(
                        color: post.isRead ? Colors.grey.shade500 : Colors.grey.shade700,
                        fontSize: 14.0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              // Timer
              _buildTimer(context),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTimer(BuildContext context) {
    if (post.isRead) {
      return const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 24.0,
      );
    }
    
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        // Find the current post in the state to get the updated timer duration
        final currentPost = state.allPosts.firstWhere(
          (p) => p.id == post.id,
          orElse: () => post,
        );
        final remainingTime = currentPost.timerDuration;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.timer_outlined,
                size: 16.0,
                color: Color(0xFF1976D2),
              ),
              const SizedBox(width: 4.0),
              Text(
                '${remainingTime}s',
                style: const TextStyle(
                  color: Color(0xFF1976D2),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
