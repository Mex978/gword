import 'package:dartz/dartz.dart';
import 'package:gword/app/core/errors/exceptions.dart';
import 'package:gword/app/core/errors/failures.dart';
import 'package:gword/app/modules/home/domain/entities/word_entity.dart';
import 'package:gword/app/modules/home/domain/repositories/word_repository.dart';
import 'package:gword/app/modules/home/infra/datasources/word_datasource.dart';

class WordRepositoryImplementation implements IWordRepository {
  final IWordDatasource datasource;

  WordRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, WordEntity>> getCurrentWord() async {
    try {
      final response = await datasource.getCurrentWord();

      if (response.isValidWord) {
        return Right(response);
      } else {
        return const Left(InvalidWordFailure());
      }
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveTry(WordEntity wordTry) async {
    try {
      if (!wordTry.isValidWord) return const Left(InvalidWordFailure());

      await datasource.saveTry(wordTry.word);

      return const Right(true);
    } on ServerException {
      return const Left(ServerFailure());
    } on WordAlreadyExistsException {
      return const Left(WordAlreadyExistsFailure());
    }
  }
}
