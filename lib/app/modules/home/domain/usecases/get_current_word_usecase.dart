import 'package:dartz/dartz.dart';
import 'package:gword/app/core/errors/failures.dart';
import 'package:gword/app/core/usecase/usecase.dart';
import 'package:gword/app/modules/home/domain/entities/word_entity.dart';
import 'package:gword/app/modules/home/domain/repositories/word_repository.dart';

class GetCurrentWordUsecase implements Usecase<WordEntity, NoParams> {
  final IWordRepository repository;

  GetCurrentWordUsecase(this.repository);

  @override
  Future<Either<Failure, WordEntity>> call(NoParams params) async {
    return await repository.getCurrentWord();
  }
}
