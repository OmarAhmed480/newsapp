import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/model/news/Articles.dart';
import 'package:newsapp/ui/widget/customLoadingWidget.dart';
import 'package:newsapp/utils/app_Style.dart';
import 'package:newsapp/utils/app_colors.dart';

import 'generalbutton.dart';

class ArticlePreviewBottomSheet extends StatelessWidget {
  final Articles article;
  final bool isDark;
  final VoidCallback onViewFullArticle;

  const ArticlePreviewBottomSheet({
    super.key,
    required this.article,
    required this.isDark,
    required this.onViewFullArticle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 30.h),
      padding: REdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      height: 413.h,
      width: 380.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: isDark
            ? AppColors.whiteColor
            : AppColors.darkColor,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              height: 219.h,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  CustomLoadingWidget(isDark: isDark),
              errorWidget: (context, url, error) => Icon(
                Icons.error_outline,
                size: 25.sp,
                color: isDark
                    ? AppColors.whiteColor
                    : AppColors.blackColor,
              ),
            ),
          ),

          SizedBox(height: 8.h),

          Directionality(
            textDirection: TextDirection.ltr,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                article.content ?? "",
                style: isDark
                    ? AppStyle.medium14blackColor
                    : AppStyle.medium14whiteColor,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
          ),

          SizedBox(height: 8.h),

          GeneralButton(
            radiusCircular: 16.r,
            backgroundColor: isDark
                ? AppColors.blackColor
                : AppColors.whiteColor,
            onPressed: onViewFullArticle,
            child: Text(
              AppLocalizations.of(context)!.viewFullArticle,
              style: isDark
                  ? AppStyle.bold16whiteColor
                  : AppStyle.bold16blackColor,
            ),
          ),
        ],
      ),
    );
  }


}