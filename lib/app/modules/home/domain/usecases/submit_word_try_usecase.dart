import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:gword/app/core/errors/failures.dart';
import 'package:gword/app/core/usecase/usecase.dart';
import 'package:gword/app/modules/home/domain/entities/word_entity.dart';
import 'package:gword/app/modules/home/domain/enums/word_enums.dart';
import 'package:gword/app/modules/home/domain/repositories/word_repository.dart';

class SubmitWordTryUsecase implements Usecase<List<LetterTryResult>, SubmitWordTryUsecaseParams> {
  final IWordRepository wordRepository;

  SubmitWordTryUsecase(this.wordRepository);

  @override
  Future<Either<Failure, List<LetterTryResult>>> call(SubmitWordTryUsecaseParams params) async {
    if (!validate(params)) return const Left(InvalidWordFailure());

    try {
      final lettersStatuses = params.currentWord.compareTo(params.currentWordTry);

      final result = await wordRepository.saveTry(params.currentWordTry);

      log(result.toString());

      return result.fold(
        (l) => Left(l),
        (r) => Right(lettersStatuses),
      );
    } on RangeError {
      return const Left(InvalidWordFailure());
    }
  }

  bool validate(SubmitWordTryUsecaseParams params) =>
      params.currentWord.isValidWord && params.currentWordTry.isValidWord;
}

class SubmitWordTryUsecaseParams {
  final WordEntity currentWord;
  final WordEntity currentWordTry;

  SubmitWordTryUsecaseParams(this.currentWord, this.currentWordTry);
}
