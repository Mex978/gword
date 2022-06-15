import 'package:dartz/dartz.dart';
import 'package:gword/app/core/errors/failures.dart';
import 'package:gword/app/modules/home/domain/entities/word_entity.dart';

abstract class IWordRepository {
  Future<Either<Failure, WordEntity>> getCurrentWord();
  Future<Either<Failure, bool>> saveTry(WordEntity wordTry);
}
