import 'package:newsapp/api/model/sources/source_response.dart';

import '../../../../../api/retrofit/model/source_response_retrofit.dart';


// TODO: abstract class using Dio.
abstract class SourceRemoteDatasource {
  Future<SourceResponse>getSource(String categoryId);
}


// TODO: abstract class using Retrofit.
abstract class SourceRemoteDatasourceRetrofit {

  Future<SourceResponseRetrofit >getSource(String categoryId);



}