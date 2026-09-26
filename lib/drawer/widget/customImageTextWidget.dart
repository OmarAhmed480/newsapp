import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_Style.dart';

class CustomImageTextWidget extends StatelessWidget {
  final String image;
  final String text;
  final double spacing;

  const CustomImageTextWidget({
    super.key,
    required this.image,
    required this.text,
    this.spacing = 11,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          fit: BoxFit.fill,
        ),
        SizedBox(width: spacing.w),
        Text(
          text,
          style: AppStyle.bold20whiteColor.copyWith(
            fontSize: 20.sp,
          ),
        ),
      ],
    );
  }
}