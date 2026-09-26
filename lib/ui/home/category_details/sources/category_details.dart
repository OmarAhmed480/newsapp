import 'package:flutter/material.dart';
import 'package:newsapp/api/api_manager.dart';

import 'package:provider/provider.dart';

import '../../../../api/model/sources/source_response.dart';
import '../../../../provider/app_them_provider.dart';
import '../../../widget/customErrorWidget.dart';
import '../../../widget/customLoadingWidget.dart';
import '../source_tab.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

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
      future: ApiManager.getSources(),

      builder: (context, snapshot) {

        // TODO: Check API loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoadingWidget(
            isDark: isDark,
          );
        }

        // TODO: Check API exception error
        if (snapshot.hasError) {
          return CustomErrorWidget(
            // TODO: Display exception error
            error: snapshot.error.toString(),

            // TODO: Retry API request
            onRetry: () {
              ApiManager.getSources();
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
              ApiManager.getSources();
              setState(() {});
            },

            isDark: isDark,
          );
        }

        // TODO: Get sources list from API response
        var sourcesList = snapshot.data?.sources ?? [];

        // TODO: Display sources
        return SourceTab(
          sourceList: sourcesList,
        );
      },
    );
  }
}