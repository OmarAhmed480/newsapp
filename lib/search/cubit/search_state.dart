
import '../../api/model/news/Articles.dart';



abstract class SearchState{}

class SearchInitialState extends SearchState {}

class SearchErrorState extends SearchState{
  String errorMessage;

  SearchErrorState({required this.errorMessage});
}

class SearchSuccessState extends SearchState{
  List<Articles>? articlesList = [];

  SearchSuccessState({required this.articlesList});
}

class SearchLoadingState extends SearchState {}
