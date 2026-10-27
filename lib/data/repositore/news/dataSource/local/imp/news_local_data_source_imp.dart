import 'package:hive_ce/hive.dart';
import 'package:newsapp/api/model/news/News_response.dart';

import '../news_local_data_source.dart';

class NewsLocalDataSourceImp implements NewsLocalDataSource {
  @override
  Future<NewsRespons> getNewsBySourcesId(String sourcesId) async {
    var box = await Hive.openBox("News");
    var newsResponse = NewsRespons.fromJson(box.get(sourcesId));

    return newsResponse;
  }

  @override
  Future<void> saveNews(NewsRespons newsResponse,String sourcesId) async {
    var box = await Hive.openBox("News");
    await box.put(sourcesId, newsResponse.toJson());

    box.close();
  }
}
