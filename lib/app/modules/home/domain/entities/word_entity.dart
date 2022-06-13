import 'package:equatable/equatable.dart';

class WordEntity extends Equatable {
  final String word;

  const WordEntity(this.word);

  List<String> get characters => word.split('');

  bool get isValidWord => word.isNotEmpty && word.length == 5;

  @override
  List<Object?> get props => [word];
}
