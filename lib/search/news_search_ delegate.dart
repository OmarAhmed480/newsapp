import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/search/widget/news_search_result_widget.dart';
import 'package:newsapp/search/widget/searchThemeFunction.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../provider/app_them_provider.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    final themeProvider = Provider.of<AppThemProvider>(context);
    final isDark = themeProvider.isDark();
    return [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.clear, color:isDark?AppColors.whiteColor: AppColors.blackColor, size: 30.sp),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    final themeProvider = Provider.of<AppThemProvider>(context);
    final isDark = themeProvider.isDark();
    return IconButton(
      onPressed: () => showResults(context),
      icon: Icon(Icons.search, color:isDark?AppColors.whiteColor: AppColors.blackColor, size: 30.sp),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final themeProvider = Provider.of<AppThemProvider>(context);
    final isDark = themeProvider.isDark();
    return NewsSearchResultWidget(query: query, isDark: isDark);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final themeProvider = Provider.of<AppThemProvider>(context);
    final isDark = themeProvider.isDark();
    return searchTheme(isDark);
  }

}


