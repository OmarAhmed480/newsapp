
import '../../../../api/model/news/News_response.dart';

abstract class SearchRepository {

  Future<NewsRespons> getNewsBySearchIn(String title);

}
