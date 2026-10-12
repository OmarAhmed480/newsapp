import 'package:newsapp/api/model/sources/source_response.dart';

abstract class SourceRemoteDatasource {

  Future<SourceResponse>getSource(String categoryId);



}