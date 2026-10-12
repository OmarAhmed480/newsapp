
import '../../../../../api/model/news/News_response.dart';
import '../../data_source/remote/search_remote_data_search.dart';
import '../search_repository.dart';

class SearchRepositoryImp implements SearchRepository{
SearchRepositoryImp({required this.remoteDataSearch});
  SearchRemoteDataSearch remoteDataSearch;
  @override
  Future<NewsRespons> getNewsBySearchIn(String title) {
   return remoteDataSearch.getNewsBySearchIn(title);
  }
}