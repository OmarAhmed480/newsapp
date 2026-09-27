import 'package:flutter/material.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/api/model/sources/source.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/newsListWidget.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/show_article_preview.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/app_them_provider.dart';
import '../../../../widget/customErrorWidget.dart';
import '../../../../widget/customLoadingWidget.dart';
import 'news_web_view.dart';

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
        }
      },
    );
  }
}
//import 'package:flutter/material.dart';
// import 'package:newsapp/api/api_manager.dart';
// import 'package:newsapp/api/model/sources/source.dart';
// import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/custom_future_builder.dart';
// import 'package:provider/provider.dart';
// import '../../../../../provider/app_them_provider.dart';
//
// class NewsWidget extends StatefulWidget {
//   const NewsWidget({
//     super.key,
//     required this.source,
//   });
//
//   final Sources source;
//
//   @override
//   State<NewsWidget> createState() => _NewsWidgetState();
// }
//
// class _NewsWidgetState extends State<NewsWidget> {
//   @override
//   Widget build(BuildContext context) {
//     var themProvider = Provider.of<AppThemProvider>(context);
//     var isDark = themProvider.isDark();
//
//     return CustomFutureBuilder(
//       future: () => ApiManager.getNewsBySourcesId(
//         sourceId: widget.source.id ?? "",
//       ),
//       isDark: isDark,
//
//       isSuccess: (data) => data.status == "ok",
//
//       getError: (data) =>
//           data.message ?? "Something went wrong",
//
//       onSuccess: (data) {
//         var newsResponse = data.articles ?? [];
//
//         return NewsListWidget(
//           newsList: newsResponse,
//           isDark: isDark,
//           onNewsTap: (index) {
//             showArticlePreview(
//               context: context,
//               article: newsResponse[index],
//               isDark: isDark,
//               onViewFullArticle: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => NewsWebView(
//                       url: newsResponse[index].url ?? '',
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }