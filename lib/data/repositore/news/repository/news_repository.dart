
import '../../../../api/model/news/News_response.dart';

abstract class NewsRepository {
  Future<NewsRespons> getNewsBySourceID(String sourceId,int pageSize, int page,  );
}
