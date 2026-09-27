import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_Style.dart';
import '../../utils/app_colors.dart';
ThemeData searchTheme(bool isDark) {
  return ThemeData(
    scaffoldBackgroundColor: isDark
        ? AppColors.darkColor
        : AppColors.whiteColor,

    appBarTheme: AppBarTheme(
      backgroundColor: isDark
          ? AppColors.darkColor
          : AppColors.whiteColor,
      iconTheme: IconThemeData(
        color: isDark
            ? AppColors.whiteColor
            : AppColors.blackColor,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: REdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 16.w,
      ),

      fillColor: isDark
          ? AppColors.darkColor
          : AppColors.whiteColor,

      filled: true,

      hintStyle: isDark
          ? AppStyle.medium14whiteColor.copyWith(
        fontSize: 20.sp,
      )
          : AppStyle.medium14blackColor.copyWith(
        fontSize: 20.sp,
      ),

      enabledBorder: outlineInputBorder(isDark),
      border: outlineInputBorder(isDark),
      focusedBorder: outlineInputBorder(isDark),
      errorBorder: outlineInputBorder(isDark),
    ),

    textTheme: TextTheme(
      titleLarge: isDark
          ? AppStyle.medium14whiteColor.copyWith(
        fontSize: 15.sp,
      )
          : AppStyle.medium14blackColor.copyWith(
        fontSize: 15.sp,
      ),
    ),
  );

}
OutlineInputBorder outlineInputBorder(bool isDark ){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(
      color: isDark ? AppColors.whiteColor : AppColors.blackColor,
      width: 1.w,
    ),
  );
}