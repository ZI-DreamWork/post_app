import 'package:dartz/dartz.dart';

import '../../../../core/Errors/Failures.dart';
import '../entities/post.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePOst(int id);
  Future<Either<Failure, Unit>> updatePost(Post post);
  Future<Either<Failure, Unit>> addPost(Post post);
}
