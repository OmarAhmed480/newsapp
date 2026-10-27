import 'package:newsapp/api/api_constants.dart';
import 'package:newsapp/api/http/http_manager.dart';
import 'package:newsapp/api/dio/dio_manager.dart';
import 'package:newsapp/api/model/sources/source_response.dart';
import 'package:newsapp/api/retrofit/model/source_response_retrofit.dart';

import '../../../../../../api/retrofit/retrofit_manager.dart';
import '../source_remote_datasource.dart';


// TODO: Implement using  Http
class SourceRemoteDatasourceHttpImp implements SourceRemoteDatasource {
  ApiManager apiManager;

  SourceRemoteDatasourceHttpImp({required this.apiManager});

  @override
  Future<SourceResponse> getSource(String categoryId) {
    return ApiManager.getSources(categoryId: categoryId);
  }
}




// TODO: Implement using Dio
class SourceRemoteDatasourceDioImp implements SourceRemoteDatasource {
  DioManager dioManager;

  SourceRemoteDatasourceDioImp({required this.dioManager});

  @override
  Future<SourceResponse> getSource(String categoryId) {
    return dioManager.getSources(categoryId: categoryId);
  }
}



// TODO: Implement using Retrofit.

class SourceRemoteDatasourceRetrofitImp implements SourceRemoteDatasourceRetrofit {
 RetrofitManager retrofitManager;

  SourceRemoteDatasourceRetrofitImp({required this.retrofitManager});

  @override
  Future<SourceResponseRetrofit> getSource(String categoryId) {
    return retrofitManager.getSource(ApiConstants.apiKey,categoryId);
  }
}
