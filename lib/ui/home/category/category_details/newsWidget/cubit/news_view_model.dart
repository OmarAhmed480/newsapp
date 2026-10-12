import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/repositore/news/repository/news_repository.dart';
import 'news_state.dart';

class NewsViewModel extends Cubit<NewsState> {
  final NewsRepository newsRepository;

  NewsViewModel({required this.newsRepository}) : super(NewsLoadingState());

  int currentPage = 1;
  final int pageSize = 20;
  bool isLoadingMore = false;
  bool hasMore = true;

  final List<dynamic> articles = [];

  Future<void> getNewsBySourceId({required String sourceId, bool loadMore = false,}) async {
    if (loadMore && (isLoadingMore || !hasMore)) {
      return;
    }
    if (!loadMore) {
      currentPage = 1;
      hasMore = true;
      articles.clear();
      emit(NewsLoadingState());
    } else {
      isLoadingMore = true;
    }

    try {
      final response = await newsRepository.getNewsBySourceID(
        sourceId,
        pageSize,
        currentPage,
      );

      if (response.status == 'error') {
        if (articles.isEmpty) {
          emit(NewsErrorState(errorMessage: response.message.toString()));
        }
        return;
      }

      if (response.status == 'ok') {
        final newArticles = response.articles ?? [];
        if (newArticles.isEmpty) {
          hasMore = false;
        } else {
          articles.addAll(newArticles);
          if (newArticles.length < pageSize) {
            hasMore = false;
          } else {
            currentPage++;
          }
        }

        emit(NewsSuccessState(articlesList: List.from(articles)));
      }
    } catch (e) {
      if (articles.isEmpty) {
        emit(NewsErrorState(errorMessage: e.toString()));
      }
    } finally {
      isLoadingMore = false;
    }
  }
}
