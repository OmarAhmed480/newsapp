import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/api/api_endpoints.dart';
import 'package:newsapp/api/model/sources/source_response.dart';
import 'package:newsapp/model/news/News_response.dart';

import 'api_constants.dart';

class ApiManager {
  // https://newsapi.org/v2/top-headlines/sources?apiKey=88a951ab596546afb6887cff9ada085d
  static Future<SourceResponse> getSources() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoints.sourceApi, {
        "apiKey": ApiConstants.apiKey,
      });
      var response = await http.get(url);
      return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  //   https://newsapi.org/v2/everything?q=bitcoin&apiKey=88a951ab596546afb6887cff9ada085d

  static Future<NewsRespons> getNewsBySourcesId({required String sourceId,}) async {
    try{
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoints.everything, {
        "apiKey": ApiEndpoints.apiKey,
        "sources": sourceId,
      });
      var newsResponse = await http.get(url);
      return NewsRespons.fromJson(jsonDecode(newsResponse.body));
    }catch(e){
      rethrow ;
    }

  }
}
