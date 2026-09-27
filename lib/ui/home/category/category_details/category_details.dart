import 'package:flutter/material.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:provider/provider.dart';
import '../../../../api/model/sources/source_response.dart';
import '../../../../model/categoryModel.dart';
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
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemProvider>(context);
    var isDark = themeProvider.isDark();
    return FutureBuilder<SourceResponse>(
      // TODO: Call API to get sources
      future: ApiManager.getSources(categoryId: widget.category.id),

      builder: (context, snapshot) {
        // TODO: Check API loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoadingWidget(isDark: isDark);
        }

        // TODO: Check API exception error
        if (snapshot.hasError) {
          return CustomErrorWidget(
            // TODO: Display exception error
            error: snapshot.error.toString(),

            // TODO: Retry API request
            onRetry: () {
              ApiManager.getSources(categoryId: widget.category.id);
              setState(() {});
            },

            isDark: isDark,
          );
        }

        // TODO: Check API response status
        if (snapshot.data?.status != "ok") {
          return CustomErrorWidget(
            // TODO: Display API response error
            error: snapshot.data?.message ?? "Something went wrong",
            // TODO: Retry API request
            onRetry: () {
              ApiManager.getSources(categoryId: widget.category.id);
              setState(() {});
            },

            isDark: isDark,
          );
        }

        // TODO: Get sources list from API response
        var sourcesList = snapshot.data?.sources ?? [];

        // TODO: Display sources
        return SourceTab(sourceList: sourcesList);
      },
    );
  }
}
//import 'package:flutter/material.dart';
// import 'package:newsapp/api/api_manager.dart';
// import 'package:provider/provider.dart';
// import '../../../../api/model/sources/source_response.dart';
// import '../../../../model/categoryModel.dart';
// import '../../../../provider/app_them_provider.dart';
// import 'newsWidget/widget/custom_future_builder.dart';
// import 'sources/source_tab.dart';
//
// class CategoryDetails extends StatefulWidget {
//   const CategoryDetails({
//     super.key,
//     required this.category,
//   });
//
//   final CategoryModel category;
//
//   @override
//   State<CategoryDetails> createState() => _CategoryDetailsState();
// }
//
// class _CategoryDetailsState extends State<CategoryDetails> {
//   @override
//   Widget build(BuildContext context) {
//     var themeProvider = Provider.of<AppThemProvider>(context);
//     var isDark = themeProvider.isDark();
//
//     return CustomFutureBuilder<SourceResponse>(
//       future: () => ApiManager.getSources(
//         categoryId: widget.category.id,
//       ),
//       isDark: isDark,
//
//       isSuccess: (data) => data.status == "ok",
//
//       getError: (data) =>
//           data.message ?? "Something went wrong",
//
//       onSuccess: (data) {
//         var sourcesList = data.sources ?? [];
//
//         return SourceTab(
//           sourceList: sourcesList,
//         );
//       },
//     );
//   }
// }