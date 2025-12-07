

import 'package:knovator_test/domain/all_posts/post_model/post_model.dart';

import 'package:dartz/dartz.dart';

import '../../core/core/errors/failure.dart';

abstract class IPostsRepo {
  Future<Either<Failure, List<PostModel>>> getPostsData({
    required int? id
});



}