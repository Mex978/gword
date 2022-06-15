import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gword/app/core/errors/failures.dart';
import 'package:gword/app/core/helpers/notification_manager.dart';
import 'package:gword/app/core/usecase/usecase.dart';
import 'package:gword/app/modules/home/domain/entities/word_entity.dart';
import 'package:gword/app/modules/home/domain/usecases/get_current_word_usecase.dart';

class HomeController extends ChangeNotifier {
  final INotificationManager notificationManager;
  final GetCurrentWordUsecase getCurrentWordUsecase;

  HomeController({required this.getCurrentWordUsecase, required this.notificationManager});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  WordEntity? _currentWord;
  WordEntity? get currentWord => _currentWord;

  List<WordEntity> _currentWordTries = [];
  List<WordEntity> get currentWordTries => _currentWordTries;

  WordEntity _currentWordTry = const WordEntity('');
  WordEntity get currentWordTry => _currentWordTry;

  Future<void> getCurrentWord(Function(Failure error) onError) async {
    _isLoading = true;
    notifyListeners();

    final result = await getCurrentWordUsecase(NoParams());
    result.fold<void>(
      (l) {
        _currentWord = null;
        onError(l);
      },
      (r) {
        _currentWord = r;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  void onClickInLetter(String letter) {
    if (!_currentWordTry.isValidWord) {
      _currentWordTry = WordEntity(_currentWordTry.word + letter);
    }

    log('_currentWordTry: $_currentWordTry', name: 'HomeController');
    notifyListeners();
  }

  void onDeleteLetter() {
    if (_currentWordTry.word.isEmpty) return;

    _currentWordTry = WordEntity(_currentWordTry.word.substring(0, _currentWordTry.word.length - 1));
    notifyListeners();
  }

  void onSubmitWord() {
    if (_currentWordTries.length < 6 && _currentWordTry.isValidWord) {
      _currentWordTries = _currentWordTries + [_currentWordTry];
      _currentWordTry = const WordEntity('');
    }

    log('_currentWordTries: $_currentWordTries', name: 'HomeController');
    notifyListeners();
  }
}
