import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({this.message = 'Um erro inesperado aconteceu.'});
}

class NotCharacterFailure extends Failure {
  const NotCharacterFailure() : super(message: 'Caracter inválido.');

  @override
  List<Object?> get props => [];
}

class WordNotFoundFailure extends Failure {
  const WordNotFoundFailure() : super(message: 'Palavra não encontrada.');

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: 'Falha ao comunicar com o servidor.');

  @override
  List<Object?> get props => [];
}

class InvalidWordFailure extends Failure {
  const InvalidWordFailure() : super(message: 'Palavra inválida.');

  @override
  List<Object?> get props => [];
}

class WordAlreadyExistsFailure extends Failure {
  const WordAlreadyExistsFailure() : super(message: 'Você já tentou essa palavra!');

  @override
  List<Object?> get props => [];
}
