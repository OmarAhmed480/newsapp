import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../api_constants.dart';
import '../model/news/News_response.dart';
import '../model/sources/source_response.dart';
import 'api_error_handler.dart';
// @singleton
class DioManager {
  DioManager._();
  static DioManager? _instance;
  static DioManager getInstance() {
    _instance ??= DioManager._();
    return _instance!;
  }
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: "https://newsapi.org",
            queryParameters: {"apiKey": ApiConstants.apiKey},
            receiveTimeout: Duration(seconds: 3),
            connectTimeout: Duration(seconds: 5),
          ),
        )
        ..interceptors.add(
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
    } on DioException catch (e) {
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
          "sources": sourceId,
        },
      );
      // TODO: Convert API response to model.
      return NewsRespons.fromJson(sourceResponse.data);
    } on DioException catch (e) {
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
    } on DioException catch (e) {
      // TODO: Handle API errors.
      throw ApiErrorHandler.handleDioException(e);
    }
  }
}
