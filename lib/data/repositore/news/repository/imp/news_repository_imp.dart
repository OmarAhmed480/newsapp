import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:newsapp/data/repositore/news/repository/news_repository.dart';

import '../../../../../api/model/news/News_response.dart';
import '../../dataSource/local/news_local_data_source.dart';
import '../../dataSource/remote/news_remote_data_source.dart';

class NewsRepositoryImp implements NewsRepository {
  NewsRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  @override
  Future<NewsRespons> getNewsBySourceID(String sourceId, int pageSize, int page,) async {
    final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {

      final newsResponse = await remoteDataSource.getNewsBySourceID(sourceId, pageSize, page,);

      localDataSource.saveNews(newsResponse, sourceId);

      return newsResponse;
    } else {
      return await localDataSource.getNewsBySourcesId(sourceId);
    }
  }
}
