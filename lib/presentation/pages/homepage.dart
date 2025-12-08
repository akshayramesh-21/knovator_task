import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator_test/application/bloc/posts/post_bloc.dart';
import 'package:knovator_test/domain/all_posts/post_model/post_model.dart';
import 'package:knovator_test/presentation/pages/post_detail_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _navigateToDetail(BuildContext context, PostModel post) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<PostBloc>(),
          child: PostDetailPage(post: post),
        ),
      ),
    );
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
                    onPressed: () =>
                        context.read<PostBloc>().add(const PostEvent.getPosts()),
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
              return _PostItem(
                post: post,
                onTap: () => _navigateToDetail(context, post),
              );
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
  final VoidCallback onTap;

  const _PostItem({required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('post-${post.id}'),
      onVisibilityChanged: (info) {
        if (post.isRead) return;
        
        final bloc = context.read<PostBloc>();
        if (info.visibleFraction > 0.5) {
          // Item is more than 50% visible - resume timer
          bloc.add(PostEvent.resumeTimer(post.id!));
        } else if (info.visibleFraction < 0.1) {
          // Item is less than 10% visible - pause timer
          bloc.add(PostEvent.pauseTimer(post.id!));
        }
      },
      child: Card(
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
            // Mark as read when tapped
            if (!post.isRead) {
              context.read<PostBloc>().add(PostEvent.markAsRead(post.id!));
            }
            // Navigate to detail page
            onTap();
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
                    color: post.isRead
                        ? Colors.grey.shade200
                        : const Color(0xFFE3F2FD),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${post.id}',
                      style: TextStyle(
                        color:
                            post.isRead ? Colors.grey : const Color(0xFF1976D2),
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
                          color:
                              post.isRead ? Colors.grey.shade700 : Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        post.body ?? 'No content',
                        style: TextStyle(
                          color: post.isRead
                              ? Colors.grey.shade500
                              : Colors.grey.shade700,
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
        // Get the latest timer duration from state
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
