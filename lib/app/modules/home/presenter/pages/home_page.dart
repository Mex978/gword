import 'package:flutter/material.dart';
import 'package:gword/app/core/helpers/bot_toast_notification_manager.dart';
import 'package:gword/app/core/helpers/notification_manager.dart';
import 'package:gword/app/core/injector/app_injector.dart';
import 'package:gword/app/core/resources/color_manager.dart';
import 'package:gword/app/core/resources/font_manager.dart';
import 'package:gword/app/core/resources/strings_manager.dart';
import 'package:gword/app/core/resources/styles_manager.dart';
import 'package:gword/app/modules/home/injector/home_injector.dart';
import 'package:gword/app/modules/home/presenter/controllers/home_controller.dart';

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
      appBar: AppBar(
        backgroundColor: ColorManager.blue,
        title: Text(StringsManager.title.i18n),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              if (_controller.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Center(
                child: Text(
                  _controller.currentWord?.word ?? '',
                  style: getNormalStyle(color: ColorManager.black, fontSize: FontSize.s20),
                ),
              );
            },
          ),
          ElevatedButton(onPressed: () {}, child: Text(StringsManager.button.i18n)),
        ],
      ),
    );
  }
}
