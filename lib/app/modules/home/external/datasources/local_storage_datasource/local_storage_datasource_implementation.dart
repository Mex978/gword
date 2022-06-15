import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:gword/app/core/errors/exceptions.dart';
import 'package:gword/app/core/local_storage_client/local_storage_client.dart';
import 'package:gword/app/core/resources/assets_manager.dart';
import 'package:gword/app/modules/home/external/datasources/local_storage_datasource/local_storage_keys/local_storage_keys.dart';
import 'package:gword/app/modules/home/infra/datasources/word_datasource.dart';
import 'package:gword/app/modules/home/infra/models/word_model.dart';

class LocalStorageDatasourceImplementation implements IWordDatasource {
  final ILocalStorageClient localStorageClient;

  LocalStorageDatasourceImplementation(this.localStorageClient);

  @override
  Future<void> fetchWords() async {
    try {
      final byteData = await rootBundle.load(DocumentsAssets.words);
      final fileContent = const Utf8Decoder().convert(byteData.buffer.asUint8List());

      final words = fileContent.split('\n');
      await localStorageClient.setListString(LocalStorageKeys.words, words);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<WordModel> getCurrentWord() async {
    try {
      final word = await localStorageClient.getString(LocalStorageKeys.currentWord);

      WordModel wordModel = WordModel(word);

      if (word.isEmpty) {
        final words = await localStorageClient.getListString(LocalStorageKeys.words);

        final _random = math.Random();
        final word = words[_random.nextInt(words.length)];

        await localStorageClient.setString(LocalStorageKeys.currentWord, word);
        wordModel = WordModel(word);
      }

      return wordModel;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> saveTry(String word) async {
    try {
      final tries = await getTries();

      if (tries.any((w) => w.word == word)) {
        throw WordAlreadyExistsException();
      }

      final newList = [...tries.map((e) => e.word), word];

      await localStorageClient.setListString(LocalStorageKeys.currentTries, newList);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<WordModel>> getTries() async {
    try {
      final words = await localStorageClient.getListString(LocalStorageKeys.currentTries);
      return words.map((word) => WordModel(word)).toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
