import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:newsapp/api/model/sources/source_response.dart';
import 'package:newsapp/api/retrofit/model/source_response_retrofit.dart';
import 'package:newsapp/data/repositore/source/data_source/remote/source_remote_datasource.dart';
import '../../data_source/local/source_local_data_source.dart';
import '../source_repository.dart';

// TODO: Implement using Dio.
class SourceRepositoryImp implements SourceRepository {
  SourceLocalDataSource localDataSource;
  SourceRemoteDatasource remoteDatasource;

  SourceRepositoryImp({
    required this.remoteDatasource,
    required this.localDataSource,
  });

  @override
  Future<SourceResponse> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        (connectivityResult.contains(ConnectivityResult.wifi))) {
      var source = await remoteDatasource.getSource(categoryId);

      localDataSource.saveSources(source, categoryId);
      return source;
    } else {
      var sourceResponse = localDataSource.getSource(categoryId);
      return sourceResponse;
    }
  }
}

// TODO: Implement using Retrofit.
class SourceRepositoryRetrofitImp implements SourceRepositoryRetrofit {
  SourceLocalDataSourceRetrofit localDataSourceRetrofit;
  SourceRemoteDatasourceRetrofit remoteDatasourceRetrofit;

  SourceRepositoryRetrofitImp({
    required this.localDataSourceRetrofit,
    required this.remoteDatasourceRetrofit,
  });

  @override
  Future<SourceResponseRetrofit> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        (connectivityResult.contains(ConnectivityResult.wifi))) {
      var source = await remoteDatasourceRetrofit.getSource(categoryId);

      localDataSourceRetrofit.saveSources(source, categoryId);
      return source;
    } else {
      var sourceResponse = localDataSourceRetrofit.getSource(categoryId);
      return sourceResponse;
    }
  }
}
