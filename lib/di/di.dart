import 'package:newsapp/api/dio/dio_manager.dart';
import 'package:newsapp/data/repositore/news/dataSource/remote/imp/news_remote_data_source_imp.dart';
import 'package:newsapp/data/repositore/news/dataSource/remote/news_remote_data_source.dart';
import 'package:newsapp/data/repositore/news/repository/imp/news_repository_imp.dart';
import 'package:newsapp/data/repositore/news/repository/news_repository.dart';
import 'package:newsapp/data/repositore/search/data_source/remote/imp/search_remote_data_search_imp.dart';
import 'package:newsapp/data/repositore/search/data_source/remote/search_remote_data_search.dart';
import 'package:newsapp/data/repositore/search/repository/search_repository.dart';
import 'package:newsapp/data/repositore/source/data_source/remote/imp/source_remote_datasource_imp.dart';
import 'package:newsapp/data/repositore/source/data_source/remote/source_remote_datasource.dart';
import 'package:newsapp/data/repositore/source/repository/imp/source_repository_imp.dart';
import 'package:newsapp/data/repositore/source/repository/source_repository.dart';

import '../data/repositore/search/repository/imp/search_repository_imp.dart';


// todo +++++++++++DioManager+++++++++++++++++++
DioManager injectDioManager() {
  return DioManager();
}



// todo +++++++++++SourceRepository+++++++++++++++++++

SourceRepository injectSourceRepository() {
  return SourceRepositoryImp(remoteDatasource: injectSourceRemoteDatasource());
}
SourceRemoteDatasource injectSourceRemoteDatasource() {
  return SourceRemoteDatasourceDioImp(dioManager: injectDioManager());
}


// todo +++++++++++++++NewsRepository++++++++++++++++++
NewsRepository injectNewsRepository() {
  return NewsRepositoryImp(remoteDataSource: injectNewsRepositoryDataSource());
}
NewsRemoteDataSource injectNewsRepositoryDataSource() {
  return NewsRemoteDataSourceImp(dioManager: injectDioManager());
}

 // todo +++++++++++ SearchRepository++++++++++++++
 SearchRepository injectSearchRepository(){
  return SearchRepositoryImp(remoteDataSearch:injectRemoteDataSearch());
 }

 SearchRemoteDataSearch injectRemoteDataSearch(){
  return  SearchRemoteDataSearchImp(dioManager:injectDioManager());
 }