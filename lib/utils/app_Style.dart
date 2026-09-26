import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'app_colors.dart';

class AppStyle {

  static TextStyle medium14whiteColor = TextStyle(
    fontSize: 14.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle medium14blackColor = TextStyle(
    fontSize: 14.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle medium12lightGray = TextStyle(
    fontSize: 12.sp,
    color: AppColors.lightGray,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle bold24blackColor = TextStyle(
    fontSize: 24.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w700,
  );
  static  TextStyle bold20whiteColor= TextStyle(
    fontSize: 20.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w700,
  );
  static  TextStyle bold16whiteColor= TextStyle(
    fontSize: 16.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w700,
  );
  static  TextStyle bold16blackColor= TextStyle(
    fontSize: 16.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w700,
  );

}