import 'package:dartz/dartz.dart';
import 'package:post_app/features/post/domain/repositories/post_repository.dart';

import '../../../../core/Errors/Failures.dart';
import '../entities/post.dart';

class UpdatePostUsecase {
  PostsRepository postsRepository;

  UpdatePostUsecase({required this.postsRepository});

  Future<Either<Failure, Unit>> call(Post post) async {
    return await postsRepository.updatePost(post);
  }
}
