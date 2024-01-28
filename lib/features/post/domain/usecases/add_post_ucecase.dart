import 'package:dartz/dartz.dart';
import 'package:post_app/core/Errors/Failures.dart';
import 'package:post_app/features/post/domain/repositories/post_repository.dart';

import '../entities/post.dart';

class AddPostUsecase {
  PostsRepository postsRepository;

  AddPostUsecase({required this.postsRepository});

  Future<Either<Failure, Unit>> call(Post post) async {
    return await postsRepository.addPost(post);
  }
}
