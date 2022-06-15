import 'package:flutter/material.dart';
import 'package:gword/app/core/helpers/bot_toast_notification_manager.dart';
import 'package:gword/app/core/helpers/notification_manager.dart';
import 'package:gword/app/core/injector/app_injector.dart';
import 'package:gword/app/modules/home/injector/home_injector.dart';
import 'package:gword/app/modules/home/presenter/controllers/home_controller.dart';
import 'package:gword/app/modules/home/presenter/widgets/grid_widget.dart';
import 'package:gword/app/modules/home/presenter/widgets/keyboard_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _controller;
  late INotificationManager notificationManager;

  @override
  void initState() {
    notificationManager = AppInjector.instance.get<BotToastNotificationManager>();

    _controller = HomeInjector.instance.get<HomeController>();
    _controller.getCurrentWord((error) => notificationManager.showErrorNotification(error.message));

    super.initState();
  }

  @override
  void dispose() {
    HomeInjector.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                    animation: _controller,
                    builder: (_, __) => GridWidget(
                          gridValues: _controller.currentWordTries,
                          currentTry: _controller.currentWordTry,
                        )),
                const SizedBox(height: 42),
                KeyboardWidget(
                  onClickInLetter: _controller.onClickInLetter,
                  onSubmitWord: _controller.onSubmitWord,
                  onDeleteLetter: _controller.onDeleteLetter,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
