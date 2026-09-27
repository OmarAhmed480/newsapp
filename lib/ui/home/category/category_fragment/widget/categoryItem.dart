import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:newsapp/utils/app_Style.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final String buttonTitle;
  final bool isDark;
  final bool isLanguage;

  final bool isRtl;

  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
    required this.buttonTitle,
    required this.isDark,
    required this.isRtl,
    required this.isLanguage
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: Container(
        margin: REdgeInsets.symmetric(vertical: 5.h),
        height: 201.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: isDark ? AppColors.whiteColor : AppColors.blackColor,
        ),
        child: Row(
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Image.asset(image, width: 160.w, height: 201.h, fit: BoxFit.cover),

            SizedBox(width: 50.w),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: isDark
                      ? AppStyle.medium14blackColor.copyWith(fontSize: 24.sp)
                      : AppStyle.medium14whiteColor.copyWith(fontSize: 24.sp),
                ),


             Container(
                    width: 130.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color:AppColors.greyColor,
                    ),
                    child: Row(
                      textDirection: isRtl
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        SizedBox(width: 10.w),

                        Text(
                          buttonTitle,
                          style: isDark
                              ? AppStyle.medium14whiteColor.copyWith(fontSize: 16.sp,)
                              : AppStyle.medium14blackColor.copyWith(fontSize: 16.sp,),
                        ),

                        const Spacer(),

                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isLanguage
                                ? (isRtl
                                ? Icons.arrow_back_ios
                                : Icons.arrow_forward_ios)
                                : (isRtl
                                ? Icons.arrow_forward_ios
                                : Icons.arrow_back_ios),
                            size: 18.sp,
                            color: isDark
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
