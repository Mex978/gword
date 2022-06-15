import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gword/app/core/errors/failures.dart';
import 'package:gword/app/modules/home/domain/entities/word_entity.dart';
import 'package:gword/app/modules/home/domain/enums/word_enums.dart';
import 'package:gword/app/modules/home/domain/repositories/word_repository.dart';
import 'package:gword/app/modules/home/domain/usecases/submit_word_try_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockWordRepository extends Mock implements IWordRepository {}

void main() {
  late WordEntity currentWord;
  late WordEntity currentWordTry;
  late SubmitWordTryUsecase submitWordTryUsecase;
  late IWordRepository wordRepository;

  setUp(() {
    currentWord = const WordEntity('tests');
    currentWordTry = const WordEntity('testa');
    wordRepository = MockWordRepository();
    submitWordTryUsecase = SubmitWordTryUsecase(wordRepository);
  });

  test('should return a InvalidWordFailure when try to pass an invalid word', () async {
    final params = SubmitWordTryUsecaseParams(currentWord, const WordEntity('test'));
    final result = await submitWordTryUsecase(params);

    expect(result.isLeft(), true);
    result.fold(
      (l) => expect(l, isA<InvalidWordFailure>()),
      (r) => null,
    );
  });

  test('should save the try when pass a valid word', () async {
    when(() => wordRepository.saveTry(currentWordTry)).thenAnswer((_) async => const Right(true));

    final params = SubmitWordTryUsecaseParams(currentWord, currentWordTry);
    final result = await submitWordTryUsecase(params);

    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<LetterTryResult>>());
  });

  test('should return a failure when try to save a invalid word', () async {
    when(() => wordRepository.saveTry(currentWordTry)).thenAnswer((_) async => const Left(InvalidWordFailure()));

    final params = SubmitWordTryUsecaseParams(currentWord, currentWordTry);
    final result = await submitWordTryUsecase(params);

    expect(result.isLeft(), true);
    result.fold(
      (l) => expect(l, isA<InvalidWordFailure>()),
      (r) => null,
    );
  });
}
