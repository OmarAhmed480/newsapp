import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/api/http/http_manager.dart';
import 'package:newsapp/api/dio/dio_manager.dart';
import 'package:newsapp/data/repositore/source/data_source/remote/imp/source_remote_datasource_imp.dart';
import 'package:newsapp/data/repositore/source/data_source/remote/source_remote_datasource.dart';
import 'package:newsapp/data/repositore/source/repository/source_repository.dart';
import 'package:newsapp/ui/home/category/category_details/sources/cubit/source_state.dart';

import '../../../../../../data/repositore/source/repository/imp/source_repository_imp.dart';

class SourceViewModel extends Cubit<SourceState> {
  late SourceRepository sourceRepository;

  SourceViewModel({required this.sourceRepository})
    : super(SourceLoadingState());

  Future<void> getSource({required String categoryId}) async {
    try {
      emit(SourceLoadingState());
      var source = await sourceRepository.getSources(categoryId);
      if (source.status == "error") {
        emit(SourceErrorState(errorMessage: source.message!));
        return;
      }
      if (source.status == "ok") {
        emit(SourceSuccessState(sourceList: source.sources ?? []));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
