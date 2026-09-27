import 'package:flutter/material.dart';
import 'package:newsapp/utils/app_Style.dart';
import 'package:newsapp/utils/app_colors.dart';

import '../../../../../api/model/sources/source.dart';

class SourceName extends StatelessWidget {
  const SourceName({
    super.key,
    required this.source,
    required this.isSelected,
    required this.isDark,
  });

  final Sources source;
  final bool isSelected;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? "",
      style: isSelected
          ? (isDark
                ? AppStyle.bold16whiteColor
                : AppStyle.bold16whiteColor.copyWith(
                    color: AppColors.blackColor,
                  ))
          : (isDark
                ? AppStyle.medium14whiteColor.copyWith(
                    fontWeight: FontWeight.w400,
                  )
                : AppStyle.medium14whiteColor.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  )),
    );
  }
}
