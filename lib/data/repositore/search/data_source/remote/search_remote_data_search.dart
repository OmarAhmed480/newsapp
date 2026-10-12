import '../../../../../api/model/news/News_response.dart';

abstract class SearchRemoteDataSearch  {
  Future<NewsRespons> getNewsBySearchIn(String title);
}