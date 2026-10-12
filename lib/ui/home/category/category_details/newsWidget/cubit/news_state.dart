import '../../../../../../api/model/news/Articles.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsErrorState extends NewsState {
  String errorMessage;

  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends NewsState {
  List<Articles>? articlesList = [];

  NewsSuccessState({required this.articlesList});
}

class NewsLoadingState extends NewsState {}
