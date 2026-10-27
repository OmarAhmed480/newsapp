import 'package:dio/dio.dart';
import 'package:newsapp/api/api_endpoints.dart';
import 'package:newsapp/api/retrofit/model/news_response_retrofit.dart';
import 'package:retrofit/retrofit.dart';

import 'model/source_response_retrofit.dart';

part 'retrofit_manager.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class RetrofitManager {
  factory RetrofitManager(Dio dio, {String? baseUrl}) = _RetrofitManager;

  @GET(ApiEndpoints.sourceApi)
  Future<SourceResponseRetrofit> getSource(
    @Query('apiKey') String apiKey,
    @Query('category') String categoryId,
  );

  @GET(ApiEndpoints.everything)
  Future<NewsResponseRetrofit> getNewsBySourceId(
    @Query('apiKey') String apiKey,
    @Query('sources') String sourceId,
  );
}
