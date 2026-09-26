import 'package:flutter/material.dart';
import 'package:newsapp/utils/app_Assets.dart';
import 'package:newsapp/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../../provider/app_them_provider.dart';
import '../../utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // TODO: Wait before navigating to Home
    Future.delayed(const Duration(seconds: 5), () {

      // TODO: Navigate to Home
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.homeRouteName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemProvider>(context);
    var isDark = themeProvider.isDark();

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.blackColor
          : AppColors.whiteColor,

      body: Center(
        child: Image.asset(
          isDark
              ? AppAssets.newsLogoLight
              : AppAssets.newsLogoDark,
          fit: BoxFit.fill,

        ),
      ),
    );
  }
}