import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/model/news/Articles.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/newsItem.dart';
import 'package:newsapp/utils/app_Style.dart';

class NewsListWidget extends StatelessWidget {
  final List<Articles> newsList;
  final bool isDark;
  final Function(int index) onNewsTap;

  const NewsListWidget({
    super.key,
    required this.newsList,
    required this.isDark,
    required this.onNewsTap,
  });

  @override
  Widget build(BuildContext context) {
    if (newsList.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context)!.noNewsAvailable,
          style: isDark
              ? AppStyle.bold16whiteColor
              : AppStyle.medium14blackColor,
        ),
      );
    }

    return ListView.builder(
      padding: REdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 8.w,
      ),
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return NewsItem(
          news: newsList[index],
          isDark: isDark,
          onTap: () {
            onNewsTap(index);
          },
          cardHeight: 332.h,
          cardWidth: 361.w,
          imageHeight: 219.h,
        );
      },
    );
  }
}