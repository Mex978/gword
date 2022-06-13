import 'package:flutter_test/flutter_test.dart';
import 'package:gword/app/modules/home/data/models/word_model.dart';
import 'package:gword/app/modules/home/domain/entities/word_entity.dart';

import '../../../../../mocks/word_mock.dart';

void main() {
  const tWordModel = WordModel('test');
  test('should be a subclass of WordEntity', () {
    expect(tWordModel, isA<WordEntity>());
  });

  test('should return a valid model', () {
    const map = wordMock;
    final model = WordModel.fromJson(map);
    expect(model, tWordModel);
  });

  test('should return a valid json', () {
    final json = tWordModel.toJson();
    expect(json, wordMock);
  });
}
