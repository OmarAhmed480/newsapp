import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../api_constants.dart';
import '../model/news/News_response.dart';
import '../model/sources/source_response.dart';
import 'api_error_handler.dart';

class DioManager {
  // TODO: Add News API base URL and API key.
  // TODO: Keep the API key in a safe place and don't upload it to GitHub.

  static final Dio dio =
      Dio(
          BaseOptions(
            // TODO: Set the base URL for News API.
            baseUrl: "https://newsapi.org",

            // TODO: Add the API key to every request.
            queryParameters: {"apiKey": ApiConstants.apiKey},

            // TODO: Set the maximum time for receiving the response.
            receiveTimeout: Duration(seconds: 3),

            // TODO: Set the maximum time for connecting to the server.
            connectTimeout: Duration(seconds: 5),
          ),
        )
        ..interceptors.add(
          // TODO: Log API requests and responses only in debug mode.
          PrettyDioLogger(
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            maxWidth: 90,
            enabled: kDebugMode,
          ),
        );

  // https://newsapi.org/v2/top-headlines/sources?apiKey=88a951ab596546afb6887cff9ada085d

  // TODO: Get news sources.
  Future<SourceResponse> getSources({required String categoryId}) async {
    try {
      var sourcesResponse = await dio.get(
        "/v2/top-headlines/sources",
        queryParameters: {"category": categoryId},
      );
      // TODO: Convert API response to model.
      return SourceResponse.fromJson(sourcesResponse.data);
    } on DioException catch (e){
      // TODO: Handle API errors.
     throw ApiErrorHandler.handleDioException(e);
    }
  }

  //   https://newsapi.org/v2/everything?q=bitcoin&apiKey=88a951ab596546afb6887cff9ada085d
  // TODO: Get news by source.
 Future<NewsRespons> getNewsBySourcesId({
   required int pageSize,
   required int page,
   required String sourceId,
  }) async {
    try {
      var sourceResponse = await dio.get(
        "/v2/everything",
        queryParameters: {
          "pageSize": pageSize,
          "page": page,
          "sources": sourceId
        },
      );
      // TODO: Convert API response to model.
      return NewsRespons.fromJson(sourceResponse.data);
    } on DioException catch (e){
      // TODO: Handle API errors.
      throw ApiErrorHandler.handleDioException(e);
    }
  }

  // TODO: Search news.
  Future<NewsRespons> getNewsBySearchIn({required String title}) async {
    try {
      var sourceResponse = await dio.get(
        "/v2/everything",
        queryParameters: {"q": title},
      );

      // TODO: Convert API response to model.
      return NewsRespons.fromJson(sourceResponse.data);
    } on DioException catch (e){
      // TODO: Handle API errors.
      throw ApiErrorHandler.handleDioException(e);
    }
  }
}
