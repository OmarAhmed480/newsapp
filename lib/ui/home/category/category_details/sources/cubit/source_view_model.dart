import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:newsapp/data/repositore/source/repository/source_repository.dart';
import 'package:newsapp/ui/home/category/category_details/sources/cubit/source_state.dart';

@injectable
class SourceViewModel extends Cubit<SourceState> {
   late SourceRepository sourceRepositoryDio;
  // SourceRepositoryRetrofit sourceRepositoryRetrofit;
  SourceViewModel({required this.sourceRepositoryDio})
    : super(SourceLoadingState());

  Future<void> getSource({required String categoryId}) async {
    try {
      emit(SourceLoadingState());
      var source = await sourceRepositoryDio.getSources(categoryId);
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
