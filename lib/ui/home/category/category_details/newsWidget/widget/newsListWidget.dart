import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/newsItem.dart';
import 'package:newsapp/utils/app_Style.dart';

import '../../../../../../api/model/news/Articles.dart';

class NewsListWidget extends StatefulWidget {
  final List<Articles> newsList;
  final bool isDark;
  final Function(int index) onNewsTap;
  final VoidCallback ?onLoadMore;

  const NewsListWidget({
    super.key,
    required this.newsList,
    required this.isDark,
    required this.onNewsTap,
    this.onLoadMore,
  });

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      widget.onLoadMore!();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.newsList.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context)!.noNewsAvailable,
          style: widget.isDark
              ? AppStyle.bold16whiteColor
              : AppStyle.medium14blackColor,
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: REdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      itemCount: widget.newsList.length,
      itemBuilder: (context, index) {
        return NewsItem(
          news: widget.newsList[index],
          isDark: widget.isDark,
          onTap: () {
            widget.onNewsTap(index);
          },
          cardHeight: 332.h,
          cardWidth: 361.w,
          imageHeight: 219.h,
        );
      },
    );
  }
}
