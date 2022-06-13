import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gword/app/core/errors/failures.dart';
import 'package:gword/app/core/usecase/usecase.dart';
import 'package:gword/app/modules/home/domain/entities/word_entity.dart';
import 'package:gword/app/modules/home/domain/repositories/word_repository.dart';
import 'package:gword/app/modules/home/domain/usecases/get_current_word_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockWordRepository extends Mock implements IWordRepository {}

void main() {
  late GetCurrentWordUsecase usecase;
  late IWordRepository repository;

  setUp(() {
    repository = MockWordRepository();
    usecase = GetCurrentWordUsecase(repository);
  });

  const tWord = WordEntity('tests');

  final tNoParams = NoParams();

  test(
    'should get the word for the current date from the repository',
    () async {
      when(repository.getCurrentWord).thenAnswer((_) async => const Right(tWord));

      final result = await usecase(tNoParams);

      expect(result, const Right(tWord));
      verify(repository.getCurrentWord);
    },
  );

  test(
    'should throw a failure when try to get the word for the current date from the repository',
    () async {
      when(repository.getCurrentWord).thenAnswer((_) async => const Left(WordNotFoundFailure()));

      final result = await usecase(tNoParams);

      expect(result, const Left(WordNotFoundFailure()));
      verify(repository.getCurrentWord);
    },
  );
}
