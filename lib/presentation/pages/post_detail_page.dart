import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator_test/application/bloc/posts/post_bloc.dart';
import 'package:knovator_test/domain/all_posts/post_model/post_model.dart';

class PostDetailPage extends StatefulWidget {
  final PostModel post;

  const PostDetailPage({super.key, required this.post});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();
    // Pause the timer for this specific post when entering detail view
    context.read<PostBloc>().add(PostEvent.pauseTimer(widget.post.id!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          // Resume the timer when going back (if not already read)
          final bloc = context.read<PostBloc>();
          final currentPost = bloc.state.allPosts.firstWhere(
            (p) => p.id == widget.post.id,
            orElse: () => widget.post,
          );
          if (!currentPost.isRead) {
            bloc.add(PostEvent.resumeTimer(widget.post.id!));
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Post Details'),
          centerTitle: true,
          elevation: 0,
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            final currentPost = state.allPosts.firstWhere(
              (p) => p.id == widget.post.id,
              orElse: () => widget.post,
            );

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Post ID badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
                    decoration: BoxDecoration(
                      color: currentPost.isRead
                          ? Colors.grey.shade200
                          : const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      'Post #${currentPost.id}',
                      style: TextStyle(
                        color: currentPost.isRead
                            ? Colors.grey
                            : const Color(0xFF1976D2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Title
                  Text(
                    currentPost.title ?? 'No Title',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  // User ID
                  Text(
                    'By User ${currentPost.userId}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  // Body
                  Text(
                    currentPost.body ?? 'No content',
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32.0),

                  // Timer status
                  if (!currentPost.isRead)
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: const Color(0xFFFFE0B2)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.pause_circle_outline,
                            color: Color(0xFFFF9800),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Text(
                              'Timer paused at ${currentPost.timerDuration}s. Will resume when you go back.',
                              style: const TextStyle(
                                color: Color(0xFFE65100),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  if (currentPost.isRead)
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: const Color(0xFFC8E6C9)),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Color(0xFF4CAF50),
                          ),
                          SizedBox(width: 12.0),
                          Expanded(
                            child: Text(
                              'This post has been marked as read.',
                              style: TextStyle(
                                color: Color(0xFF2E7D32),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 24.0),

                  // Mark as read button
                  if (!currentPost.isRead)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context
                              .read<PostBloc>()
                              .add(PostEvent.markAsRead(currentPost.id!));
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Mark as Read'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1976D2),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
