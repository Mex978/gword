import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:gword/app/core/resources/assets_manager.dart';
import 'package:gword/app/modules/home/data/datasources/word_datasource.dart';
import 'package:gword/app/modules/home/data/models/word_model.dart';

class LocalFilesImplementation extends IWordDatasource {
  @override
  Future<WordModel> getCurrentWord() async {
    final byteData = await rootBundle.load(DocumentsAssets.words);

    final file = File('${(Directory.current).path}/words.txt');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    final fileContent = await file.readAsString();
    final words = fileContent.split('\n');
    final _random = Random();
    var element = words[_random.nextInt(words.length)];

    return WordModel.fromJson({'word': element});
  }
}
