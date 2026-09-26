import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/api/model/sources/source.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/ui/home/category_details/newsWidget/widget/newsItem.dart';
import 'package:newsapp/utils/app_Style.dart';
import 'package:provider/provider.dart';
import '../../../../provider/app_them_provider.dart';
import '../../../widget/customErrorWidget.dart';
import '../../../widget/customLoadingWidget.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});

  final Sources source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var themProvider = Provider.of<AppThemProvider>(context);
    var isDark = themProvider.isDark();
    return FutureBuilder(
      future: ApiManager.getNewsBySourcesId(sourceId: widget.source.id ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoadingWidget(isDark: isDark);
        } else if (snapshot.hasError) {
          return CustomErrorWidget(
            error: snapshot.error.toString(),
            onRetry: () {
              ApiManager.getNewsBySourcesId(sourceId: widget.source.id ?? "");
              setState(() {});
            },
            isDark: isDark,
          );
        } else if (snapshot.data?.status != "ok") {
          return CustomErrorWidget(
            error: snapshot.data?.message.toString() ?? "Something went wrong",
            onRetry: () {
              ApiManager.getNewsBySourcesId(sourceId: widget.source.id ?? "");
              setState(() {});
            },
            isDark: isDark,
          );
        } else {
          var newsResponse = snapshot.data?.articles ?? [];
          return newsResponse.isEmpty?Center(
            child: Text(AppLocalizations.of(context)!.noNewsAvailable,
              style: isDark
                ? AppStyle.bold16whiteColor
                : AppStyle.medium14blackColor,),
          ) :ListView.builder(
            padding: REdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
            itemCount: newsResponse.length,
            itemBuilder: (context, index) => NewsItem(
              news: newsResponse[index],
              isDark: isDark,
              onTap: () {

              },
              cardHeight: 332.h,
              cardWidth: 361.w,
              imageHeight: 219.h,
            ),
          );
        }
      },
    );
  }
}
