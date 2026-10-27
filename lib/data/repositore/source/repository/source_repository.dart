import 'package:newsapp/api/model/sources/source_response.dart';
import 'package:newsapp/api/retrofit/model/source_response_retrofit.dart';

abstract class SourceRepository {


  Future<SourceResponse>getSources(String categoryId,);

}




abstract class SourceRepositoryRetrofit {


  Future<SourceResponseRetrofit>getSources(String categoryId,);

}