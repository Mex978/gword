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
}
