import '../../../../../api/model/news/News_response.dart';

abstract class NewsLocalDataSource {

  Future<NewsRespons> getNewsBySourcesId(String sourcesId);
  void saveNews(NewsRespons  newsResponse,String sourcesId);



}