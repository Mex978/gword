import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gword/app/core/errors/exceptions.dart';
import 'package:gword/app/core/errors/failures.dart';
import 'package:gword/app/modules/home/domain/repositories/word_repository.dart';
import 'package:gword/app/modules/home/infra/datasources/word_datasource.dart';
import 'package:gword/app/modules/home/infra/models/word_model.dart';
import 'package:gword/app/modules/home/infra/repositories/word_repository_implementation.dart';
import 'package:mocktail/mocktail.dart';

class MockWordDatasource extends Mock implements IWordDatasource {}

void main() {
  late IWordDatasource datasource;
  late IWordRepository repository;

  setUp(() {
    datasource = MockWordDatasource();
    repository = WordRepositoryImplementation(datasource);
  });

  const tWordModel = WordModel('tests');

  test('should return a word model when calls the datasource', () async {
    when(datasource.getCurrentWord).thenAnswer((_) async => tWordModel);
    final result = await repository.getCurrentWord();
    expect(result, const Right(tWordModel));
    verify(datasource.getCurrentWord).called(1);
  });

  test('should return a invalid word failure when calls the datasource', () async {
    when(datasource.getCurrentWord).thenAnswer((_) async => const WordModel('test'));
    final result = await repository.getCurrentWord();
    expect(result, const Left(InvalidWordFailure()));
    verify(datasource.getCurrentWord).called(1);
  });

  test('should return a server failure when calls the datasource', () async {
    when(datasource.getCurrentWord).thenThrow(ServerException());
    final result = await repository.getCurrentWord();
    expect(result, const Left(ServerFailure()));
    verify(datasource.getCurrentWord).called(1);
  });

  test('should return success when try to save a word try', () async {
    when(() => datasource.saveTry(tWordModel.word)).thenAnswer((_) async => true);
    final result = await repository.saveTry(tWordModel);
    expect(result.isRight(), true);
  });

  test('should thrown a server exception when try to save a word try', () async {
    when(() => datasource.saveTry(tWordModel.word)).thenThrow(ServerException());
    final result = await repository.saveTry(tWordModel);
    expect(result.isLeft(), true);
    result.fold((l) => expect(l, const ServerFailure()), (r) => null);
  });
}
