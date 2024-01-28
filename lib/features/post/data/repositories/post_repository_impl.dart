import 'package:dartz/dartz.dart';
import 'package:post_app/core/Errors/Failures.dart';
import 'package:post_app/features/post/domain/entities/post.dart';
import 'package:post_app/features/post/domain/repositories/post_repository.dart';

class PostsRepositoryIml implements PostsRepository {
  @override
  Future<Either<Failure, Unit>> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePOst(int id) {
    // TODO: implement deletePOst
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
