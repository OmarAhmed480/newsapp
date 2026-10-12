import 'package:newsapp/api/dio/dio_manager.dart';

import '../../../../../../api/model/news/News_response.dart';
import '../search_remote_data_search.dart';

class SearchRemoteDataSearchImp implements SearchRemoteDataSearch{
  DioManager dioManager;
SearchRemoteDataSearchImp({required this.dioManager});

  @override
  Future<NewsRespons> getNewsBySearchIn(String title) {
  return dioManager.getNewsBySearchIn(title: title);
  }
}