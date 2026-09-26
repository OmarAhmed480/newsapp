import 'package:flutter/material.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/ui/home/widget/newsAppBar.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../../provider/app_language_provider.dart';
import '../../provider/app_them_provider.dart';
import '../../drawer/homeDrawer.dart';
import 'category_details/newsWidget/newsWidget.dart';
import 'category_details/source_tab.dart';
import 'category_details/sources/category_details.dart';
import 'category_fragment/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  @override
  Widget build(BuildContext context) {
    var themProvider = Provider.of<AppThemProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var isDark = themProvider.isDark();
    return Scaffold(
      backgroundColor: isDark ? AppColors.blackColor : AppColors.whiteColor,
      appBar: NewsAppBar(
        isDark: isDark,
        onSearchPressed: () {
          // TODO: Search
        },
      ),

      drawer:HomeDrawer(
        isDark: isDark,
        themeProvider: themProvider,
        languageProvider: languageProvider,
        onGoPressed: () {
          // TODO: Go action

        },
      ),

      body:
     // CategoryFragment(),
      CategoryDetails(),
    );
  }
}
