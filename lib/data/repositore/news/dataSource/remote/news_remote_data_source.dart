
import '../../../../../api/model/news/News_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsRespons> getNewsBySourceID(String sourceId,int pageSize, int page,);
}
