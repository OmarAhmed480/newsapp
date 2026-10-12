import 'package:newsapp/data/repositore/news/repository/news_repository.dart';

import '../../../../../api/model/news/News_response.dart';
import '../../dataSource/remote/news_remote_data_source.dart';

class NewsRepositoryImp implements NewsRepository {
  NewsRepositoryImp({required this.remoteDataSource});

  NewsRemoteDataSource remoteDataSource;

  @override
  Future<NewsRespons> getNewsBySourceID(String sourceId,int pageSize, int page,) {
    return remoteDataSource.getNewsBySourceID(sourceId, pageSize, page);
  }
}
