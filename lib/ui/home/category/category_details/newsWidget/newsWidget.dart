import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/api/model/sources/source.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/cubit/news_state.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/newsListWidget.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/show_article_preview.dart';
import 'package:provider/provider.dart';
import '../../../../../di/di.dart';
import '../../../../../provider/app_them_provider.dart';
import '../../../../widget/customErrorWidget.dart';
import '../../../../widget/customLoadingWidget.dart';
import 'cubit/news_view_model.dart';

import 'news_web_view.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});

  final Sources source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel(
    newsRepository: injectNewsRepository(),
  );

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getNewsBySourceId(sourceId: widget.source.id!);
    }
  }

  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(sourceId: widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    var themProvider = Provider.of<AppThemProvider>(context);
    var isDark = themProvider.isDark();

    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(
        builder: (context, state) {
          if (state is NewsSuccessState) {
            var newsResponse = state.articlesList!;
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
                        builder: (context) =>
                            NewsWebView(url: newsResponse[index].url ?? ''),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is NewsErrorState) {
            return CustomErrorWidget(
              error: state.errorMessage,
              onRetry: () {
                viewModel.getNewsBySourceId(sourceId: widget.source.id!);
              },
              isDark: isDark,
            );
          } else {
            return CustomLoadingWidget(isDark: isDark);
          }
        },
      ),
    );
  }
}
