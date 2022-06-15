// import 'dart:convert';
// import 'dart:math' as math;

// import 'package:flutter/services.dart';
// import 'package:gword/app/core/errors/exceptions.dart';
// import 'package:gword/app/core/resources/assets_manager.dart';
// import 'package:gword/app/modules/home/data/datasources/word_datasource.dart';
// import 'package:gword/app/modules/home/data/models/word_model.dart';

// class LocalFilesDatasourceImplementation extends IWordDatasource {
//   @override
//   Future<WordModel> getCurrentWord() async {
//     try {
//       final byteData = await rootBundle.load(DocumentsAssets.words);
//       final fileContent = const Utf8Decoder().convert(byteData.buffer.asUint8List());

//       final words = fileContent.split('\n');
//       final _random = math.Random();
//       final word = words[_random.nextInt(words.length)];

//       return WordModel.fromJson({'word': word});
//     } catch (e) {
//       throw ServerException();
//     }
//   }
// }
