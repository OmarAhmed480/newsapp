import 'package:newsapp/api/dio/dio_manager.dart';
import 'package:newsapp/data/repositore/news/dataSource/remote/news_remote_data_source.dart';
import '../../../../../../api/model/news/News_response.dart';

// todo  by Dio
class NewsRemoteDataSourceImp implements NewsRemoteDataSource {
  DioManager dioManager;

  NewsRemoteDataSourceImp({required this.dioManager});

  @override
  Future<NewsRespons> getNewsBySourceID(String sourceId,int pageSize, int page,) {
    return dioManager.getNewsBySourcesId(
      sourceId: sourceId,
      pageSize: pageSize,
      page: page,
    );
  }
}
