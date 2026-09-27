import 'package:flutter/material.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/news_web_view.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/newsListWidget.dart';
import 'package:newsapp/ui/widget/customErrorWidget.dart';
import 'package:newsapp/ui/widget/customLoadingWidget.dart';
import '../../ui/home/category/category_details/newsWidget/widget/show_article_preview.dart';

class NewsSearchResultWidget extends StatelessWidget {
  final String query;
  final bool isDark;

  const NewsSearchResultWidget({
    super.key,
    required this.query,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsBySearchIn(
        title: query,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoadingWidget(
            isDark: isDark,
          );
        }

        if (snapshot.hasError) {
          return CustomErrorWidget(
            error: snapshot.error.toString(),
            isDark: isDark,
            onRetry: ()=>ApiManager.getNewsBySearchIn(title: query),

          );
        }

        if (snapshot.data?.status != "ok") {
          return CustomErrorWidget(
            error:snapshot.data?.message.toString() ??
                "Something went wrong",
            isDark: isDark,
            onRetry: ()=>ApiManager.getNewsBySearchIn(title: query),
          );
        }

        final newsResponse = snapshot.data?.articles ?? [];

        return NewsListWidget(
          newsList: newsResponse,
          isDark: isDark,
          onNewsTap: (index) {
            showArticlePreview(
              context: context,
              article: newsResponse[index],
              isDark: isDark,
              onViewFullArticle: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewsWebView(
                      url: newsResponse[index].url ?? '',
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

}