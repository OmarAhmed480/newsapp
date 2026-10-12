import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/repositore/search/repository/search_repository.dart';
import 'package:newsapp/search/cubit/search_state.dart';

class SearchViewModel extends Cubit<SearchState>{
  SearchRepository searchRepository;
  SearchViewModel({required this.searchRepository}):super(SearchInitialState());

  getNewsBySearchIn({required String title}) async {
    emit(SearchLoadingState());
    try{
      var searchResponse =await searchRepository.getNewsBySearchIn(title);
      if(searchResponse .status=="error"){
        emit(SearchErrorState(errorMessage: searchResponse.message ?? 'Something went wrong',));
        return;
      }
      if(searchResponse.status=="ok"){
        emit(SearchSuccessState(articlesList: searchResponse.articles??[]));
        return;
      }
    }catch(e){
      emit(SearchErrorState(errorMessage: e.toString()));
      return;
    }

  }
}