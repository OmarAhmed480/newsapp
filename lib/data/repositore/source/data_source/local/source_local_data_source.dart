import 'package:newsapp/api/model/sources/source_response.dart';
import 'package:newsapp/api/retrofit/model/source_response_retrofit.dart';



// TODO: abstract class using Dio.
abstract class SourceLocalDataSource {

  Future<SourceResponse>getSource(String categoryId);

  void saveSources(SourceResponse sourceResponse,String categoryId);

}


// TODO: abstract class using Retrofit.
abstract class SourceLocalDataSourceRetrofit {

  Future<SourceResponseRetrofit>getSource(String categoryId);

  void saveSources(SourceResponseRetrofit sourceResponse,String categoryId);

}