import 'package:flutter/material.dart';
import 'package:newsapp/ui/home/widget/newsAppBar.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../../model/categoryModel.dart';
import '../../provider/app_language_provider.dart';
import '../../provider/app_them_provider.dart';
import '../../drawer/homeDrawer.dart';
import '../../search/news_search_ delegate.dart';
import 'category/category_details/category_details.dart';
import 'category/category_fragment/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? isSelectedCategory;

  @override
  Widget build(BuildContext context) {
    var themProvider = Provider.of<AppThemProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var isDark = themProvider.isDark();
    return Scaffold(
      backgroundColor: isDark ? AppColors.blackColor : AppColors.whiteColor,
      appBar: NewsAppBar(
        isSelectedCategory: isSelectedCategory,
        isDark: isDark,
        onSearchPressed: () =>
            showSearch(context: context, delegate: NewsSearchDelegate()),
      ),

      drawer: HomeDrawer(
        isDark: isDark,
        themeProvider: themProvider,
        languageProvider: languageProvider,
        onGoPressed: () {
          // TODO:Go Home Drawer
          goHomeDrawer();
        },
      ),

      body: isSelectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : CategoryDetails(category: isSelectedCategory!),
    );
  }

  void onCategoryItemClick({required CategoryModel newCategory}) {
    isSelectedCategory = newCategory;
    setState(() {});
  }

  void goHomeDrawer() {
    setState(() {
      isSelectedCategory = null;
      Navigator.pop(context);
    });
  }
}
