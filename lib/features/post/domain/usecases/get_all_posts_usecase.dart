import 'package:dartz/dartz.dart';
import 'package:post_app/core/Errors/Failures.dart';
import 'package:post_app/features/post/domain/repositories/post_repository.dart';

import '../entities/post.dart';

class GetAllPostsUsecase {
  PostsRepository repository;
  GetAllPostsUsecase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
