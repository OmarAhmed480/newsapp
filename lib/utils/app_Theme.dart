import 'package:flutter/material.dart';


import 'app_Style.dart';
import 'app_colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      centerTitle: true,
      titleTextStyle: AppStyle.medium14blackColor,
      iconTheme: IconThemeData(
        color: AppColors.blackColor,
        size: 24,
      ),

    ),
    iconTheme: IconThemeData(
      color: AppColors.blackColor,
      size: 24,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.blackColor),
      headlineMedium: TextStyle(color: AppColors.blackColor).copyWith(fontSize: 24),
      titleLarge:AppStyle.bold24blackColor.copyWith(
        fontSize: 30,
        color: AppColors.whiteColor,

      ),
        bodySmall: AppStyle.medium14whiteColor.copyWith(fontSize: 24)

    ),
    dividerColor: Colors.grey,

  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(

      backgroundColor: AppColors.blackColor,
      centerTitle: true,
      titleTextStyle: AppStyle.medium14whiteColor,
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
        size: 24,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
      size: 24,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.whiteColor),
      headlineMedium: TextStyle(color: AppColors.whiteColor).copyWith(fontSize: 24),
      titleLarge:AppStyle.bold24blackColor.copyWith(
        color: AppColors.blackColor,

      ),
        bodySmall: AppStyle.medium14whiteColor.copyWith(fontSize: 24)
    ),
    dividerColor: Colors.grey,

  );
}