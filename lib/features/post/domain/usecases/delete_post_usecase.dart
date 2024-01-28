import 'package:dartz/dartz.dart';
import 'package:post_app/core/Errors/Failures.dart';
import 'package:post_app/features/post/domain/repositories/post_repository.dart';

class DeletePostUseCase {
  final PostsRepository repository;
  DeletePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int id) async {
    return repository.deletePOst(id);
  }
}
