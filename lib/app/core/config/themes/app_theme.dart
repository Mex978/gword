import 'package:flutter/material.dart';
import 'package:gword/app/core/resources/color_manager.dart';
import 'package:gword/app/core/resources/font_manager.dart';
import 'package:gword/app/core/resources/styles_manager.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: ColorManager.blue,
      primaryColorLight: ColorManager.lightGrey,
      primarySwatch: Colors.blue,
      hintColor: ColorManager.lowOpacityGrey,
      shadowColor: ColorManager.veryLowOpacityGrey,
      bottomAppBarColor: ColorManager.black26,
      focusColor: ColorManager.black,
      disabledColor: ColorManager.black54,
      dialogBackgroundColor: ColorManager.black87,
      hoverColor: ColorManager.black45,
      indicatorColor: ColorManager.black38,
      dividerColor: ColorManager.black12,
      backgroundColor: ColorManager.lightBlack,
      selectedRowColor: ColorManager.lightGrey,
      toggleableActiveColor: ColorManager.darkWhite,
      scaffoldBackgroundColor: ColorManager.white,
      errorColor: ColorManager.black,
      canvasColor: ColorManager.transparent,
      splashColor: ColorManager.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: ColorManager.white,
        shadowColor: ColorManager.lowOpacityGrey,
        iconTheme: const IconThemeData(color: ColorManager.black),
        titleTextStyle: getNormalStyle(fontSize: FontSize.s16, color: ColorManager.black),
      ),
      textTheme: TextTheme(
        bodyText1: getNormalStyle(color: ColorManager.black),
        bodyText2: getNormalStyle(color: ColorManager.white),
        headline1: getNormalStyle(color: ColorManager.grey, fontSize: 15),
        headline2: getBoldStyle(color: ColorManager.black, fontSize: 15),
        headline3: getMediumStyle(color: ColorManager.black, fontSize: 15),
        headline5: getNormalStyle(color: ColorManager.shimmerLightGrey),
        headline6: getNormalStyle(color: Colors.white),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: ColorManager.black,
      primaryColorLight: ColorManager.black54,
      primarySwatch: Colors.grey,
      hintColor: ColorManager.darkGray,
      shadowColor: ColorManager.darkWhite,
      focusColor: ColorManager.white,
      dialogBackgroundColor: ColorManager.white,
      hoverColor: ColorManager.grey,
      indicatorColor: ColorManager.grey,
      dividerColor: ColorManager.grey,
      bottomAppBarColor: ColorManager.grey,
      toggleableActiveColor: ColorManager.black54,
      backgroundColor: ColorManager.darkGray,
      selectedRowColor: ColorManager.darkGray,
      errorColor: ColorManager.grey,
      disabledColor: ColorManager.white,
      scaffoldBackgroundColor: ColorManager.black,
      canvasColor: ColorManager.transparent,
      splashColor: ColorManager.darkGray,
      appBarTheme: AppBarTheme(
        elevation: 1,
        iconTheme: const IconThemeData(color: ColorManager.white),
        color: ColorManager.black,
        shadowColor: ColorManager.lowOpacityGrey,
        titleTextStyle: getNormalStyle(fontSize: FontSize.s16, color: ColorManager.white),
      ),
      textTheme: TextTheme(
        bodyText1: getNormalStyle(color: ColorManager.white),
        bodyText2: getNormalStyle(color: ColorManager.black),
        headline1: getNormalStyle(color: ColorManager.grey, fontSize: 15),
        headline2: getBoldStyle(color: ColorManager.white, fontSize: 15),
        headline3: getMediumStyle(color: ColorManager.white, fontSize: 15),
        headline5: getNormalStyle(color: Colors.grey[500]!),
        headline6: getNormalStyle(color: ColorManager.shimmerDarkGrey),
      ),
    );
  }
}
