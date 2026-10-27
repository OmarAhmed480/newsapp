import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/ui/home/category/category_details/sources/cubit/source_state.dart';
import 'package:newsapp/ui/home/category/category_details/sources/cubit/source_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../di/di.dart';
import '../../../../api/model/categoryModel.dart';
import '../../../../provider/app_them_provider.dart';
import '../../../widget/customErrorWidget.dart';
import '../../../widget/customLoadingWidget.dart';
import 'sources/source_tab.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});

  CategoryModel category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceViewModel viewModel = SourceViewModel(sourceRepositoryDio: injectSourceRepository(), );
  // SourceViewModel viewModel = SourceViewModel(sourceRepositoryRetrofit: injectSourceRepositoryRetrofit());

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemProvider>(context);
    var isDark = themeProvider.isDark();
    return BlocProvider(
      create: (context) => viewModel..getSource(categoryId:  widget.category.id),
      child: BlocBuilder<SourceViewModel, SourceState>(
        builder: (context, state) {
          if (state is SourceSuccessState) {
            return SourceTab(sourceList: state.sourceList);
          } else if (state is SourceErrorState) {
            return CustomErrorWidget(
              // TODO: Display exception error
              error: state.errorMessage.toString(),
              // TODO: Retry API request
              onRetry: () {
                viewModel.getSource(categoryId: widget.category.id);
              },
              isDark: isDark,
            );
          } else {
            return CustomLoadingWidget(isDark: isDark);
          }
        },
      ),
    );
  }
}
