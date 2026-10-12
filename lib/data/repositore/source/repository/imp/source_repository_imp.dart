import 'package:newsapp/api/model/sources/source_response.dart';
import 'package:newsapp/data/repositore/source/data_source/remote/source_remote_datasource.dart';

import '../source_repository.dart';

class SourceRepositoryImp  implements SourceRepository{

  SourceRemoteDatasource remoteDatasource;
  SourceRepositoryImp({required this.remoteDatasource});
  @override
  Future<SourceResponse> getSources(String categoryId) {
return remoteDatasource.getSource(categoryId);
  }
}