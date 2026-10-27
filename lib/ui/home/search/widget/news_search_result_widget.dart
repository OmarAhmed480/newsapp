import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/news_web_view.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/newsListWidget.dart';
import 'package:newsapp/ui/widget/customErrorWidget.dart';
import '../../../../di/di.dart';
import '../../../widget/customLoadingWidget.dart';
import '../../category/category_details/newsWidget/widget/show_article_preview.dart';
import '../cubit/search_state.dart';
import '../cubit/search_view_model.dart';

class NewsSearchResultWidget extends StatefulWidget {
  final String query;
  final bool isDark;

  const NewsSearchResultWidget({
    super.key,
    required this.query,
    required this.isDark,
  });

  @override
  State<NewsSearchResultWidget> createState() => _NewsSearchResultWidgetState();
}

class _NewsSearchResultWidgetState extends State<NewsSearchResultWidget> {
  SearchViewModel viewModel = SearchViewModel(
    searchRepository: injectSearchRepository(),
  );

  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySearchIn(title: widget.query);
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchViewModel, SearchState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SearchSuccessState) {
          final newsResponse = state.articlesList ?? [];
          return NewsListWidget(

            newsList: newsResponse,
            isDark: widget.isDark,
            onNewsTap: (index) {
              showArticlePreview(
                context: context,
                article: newsResponse[index],
                isDark: widget.isDark,
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
        } else if (state is SearchErrorState) {
          return CustomErrorWidget(
            error: state.errorMessage,
            isDark: widget.isDark,
            onRetry: () => viewModel.getNewsBySearchIn(title: widget.query),
          );
        } else {
          return CustomLoadingWidget(isDark: widget.isDark);
        }
      },
    );
  }
}
