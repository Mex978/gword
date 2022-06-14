import 'package:flutter/material.dart';
import 'package:gword/app/core/config/routes/app_routes.dart';
import 'package:gword/app/core/resources/color_manager.dart';
import 'package:gword/app/core/resources/font_manager.dart';
import 'package:gword/app/core/resources/styles_manager.dart';
import 'package:gword/app/modules/home/injector/home_injector.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      await HomeInjector.instance.init();
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'gWord',
          style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
        ),
      ),
    );
  }
}
