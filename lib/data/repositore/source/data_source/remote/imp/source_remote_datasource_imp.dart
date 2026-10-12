import 'package:newsapp/api/http/http_manager.dart';
import 'package:newsapp/api/dio/dio_manager.dart';
import 'package:newsapp/api/model/sources/source_response.dart';

import '../source_remote_datasource.dart';

// todo  by Http
class SourceRemoteDatasourceHttpImp implements SourceRemoteDatasource {
  ApiManager apiManager;

  SourceRemoteDatasourceHttpImp({required this.apiManager});

  @override
  Future<SourceResponse> getSource(String categoryId) {
    return ApiManager.getSources(categoryId: categoryId);
  }
}




// todo  by Dio
class SourceRemoteDatasourceDioImp implements SourceRemoteDatasource {
 DioManager dioManager;

  SourceRemoteDatasourceDioImp({required this.dioManager});

  @override
  Future<SourceResponse> getSource(String categoryId) {
    return dioManager.getSources(categoryId: categoryId);
  }
}
