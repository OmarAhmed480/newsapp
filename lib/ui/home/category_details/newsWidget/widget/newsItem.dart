import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../utils/app_Style.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../widget/customLoadingWidget.dart';


class NewsItem extends StatelessWidget {
var news;
  final bool isDark;
  final VoidCallback onTap;

  final double cardHeight;
  final double cardWidth;
  final double imageHeight;
 NewsItem({
    super.key,
    required this.news,
    required this.isDark,
    required this.onTap,
    required this.cardHeight,
    required this.cardWidth,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 4.h,
        ),
        margin: REdgeInsets.symmetric(
          vertical: 5.h,
        ),
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark
                ? AppColors.whiteColor
                : AppColors.blackColor,
            width: 1.w,
          ),
          color: isDark
              ? AppColors.blackColor
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                height: imageHeight,
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

            SizedBox(height: 10.h),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                news.title ?? "",
                style: isDark
                    ? AppStyle.bold16whiteColor
                    : AppStyle.bold16blackColor,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: Text(
                    "by : ${news.author ?? ""}",
                    style: AppStyle.medium12lightGray,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),

                SizedBox(width: 8.w),

                Text(
                  news.publishedAt == null
                      ? ""
                      : timeago.format(
                    DateTime.parse(news.publishedAt!),
                  ),
                  style: AppStyle.medium12lightGray,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}