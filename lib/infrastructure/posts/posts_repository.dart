import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:knovator_test/core/core/api_end_points/api.dart';
import 'package:knovator_test/core/core/errors/failure.dart';
import 'package:knovator_test/domain/all_posts/i_all_product_repo.dart';
import 'package:knovator_test/domain/all_posts/post_model/post_model.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IPostsRepo)
class PostsRepository implements IPostsRepo {
  @override
  Future<Either<Failure, List<PostModel>>> getPostsData() async {
    try {
      final response = await http.get(Uri.parse("${ApiEndPoint.postsGet}"));

      if (response.statusCode == 200) {
        final decodedJson = await jsonDecode(response.body);

        if (decodedJson is List) {
          // If it's a List
          final List<PostModel> products = decodedJson
              .map(
                (jsonItem) =>
                    PostModel.fromJson(jsonItem as Map<String, dynamic>),
              )
              .toList();
          return Right(products);
        } else if (decodedJson is Map<String, dynamic>) {
          // If it's a Map (single product)
          final posts = PostModel.fromJson(decodedJson);
          return Right([posts]); // return as a List with 1 item
        } else {
          return Left(ServerFailure("Unexpected response format"));
        }
      } else {
        return Left(ServerFailure("Error code: ${response.statusCode}"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getPostData({required int? id})async {
    try {
      final response = await http.get(Uri.parse("${ApiEndPoint.postsGet}/$id"));

      if (response.statusCode == 200) {
        final decodedJson = await jsonDecode(response.body);

        if (decodedJson is List) {
          // If it's a List
          final List<PostModel> products = decodedJson
              .map(
                (jsonItem) =>
                PostModel.fromJson(jsonItem as Map<String, dynamic>),
          )
              .toList();
          return Right(products);
        } else if (decodedJson is Map<String, dynamic>) {
          // If it's a Map (single product)
          final posts = PostModel.fromJson(decodedJson);
          return Right([posts]); // return as a List with 1 item
        } else {
          return Left(ServerFailure("Unexpected response format"));
        }
      } else {
        return Left(ServerFailure("Error code: ${response.statusCode}"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
