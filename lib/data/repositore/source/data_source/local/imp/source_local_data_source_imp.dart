import 'package:hive_ce/hive.dart';
import 'package:newsapp/api/model/sources/source_response.dart';
import 'package:newsapp/api/retrofit/model/source_response_retrofit.dart';

import '../source_local_data_source.dart';








// TODO: Implement using Dio.
class SourceLocalDataSourceImp implements SourceLocalDataSource {
  @override
  Future<SourceResponse> getSource(String categoryId) async {
    var box = await Hive.openBox("Sources");
   var localSource=SourceResponse.fromJson( box.get(categoryId));
   return localSource;
  }

  @override
  Future<void> saveSources(SourceResponse sourceResponse,String categoryId) async {
    var box = await Hive.openBox("Sources");
    await box.put(categoryId, sourceResponse.toJson());
    box.close();
  }
}

// TODO: Implement using Retrofit.
class SourceLocalDataSourceRetrofitImp implements SourceLocalDataSourceRetrofit {
  @override
  Future<SourceResponseRetrofit> getSource(String categoryId) async {
    var box = await Hive.openBox("Sources");
    var localSource=SourceResponseRetrofit.fromJson( box.get(categoryId));
    return localSource;
  }

  @override
  Future<void> saveSources(SourceResponseRetrofit sourceResponse,String categoryId) async {
    var box = await Hive.openBox("Sources");
    await box.put(categoryId, sourceResponse.toJson());
    box.close();
  }
}
