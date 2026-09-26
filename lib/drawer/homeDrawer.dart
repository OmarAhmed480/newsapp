import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/drawer/widget/drawerSettingsWidget.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/utils/app_Assets.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:newsapp/utils/app_Style.dart';
import 'package:newsapp/utils/app_string.dart';
import 'package:newsapp/drawer/widget/customImageTextWidget.dart';

class HomeDrawer extends StatelessWidget {
  final bool isDark;
  final dynamic themeProvider;
  final dynamic languageProvider;

  final VoidCallback? onGoPressed;

  const HomeDrawer({
    super.key,
    required this.isDark,
    required this.themeProvider,
    required this.languageProvider,
    this.onGoPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 269.w,
      color: AppColors.blackColor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: AppColors.whiteColor,
            width: 269.w,
            height: 166.h,
            child: Text(AppString.news, style: AppStyle.bold24blackColor),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                GestureDetector(
                  onTap: onGoPressed,
                  child: CustomImageTextWidget(
                    image: AppAssets.home_1,
                    text: AppLocalizations.of(context)!.go,
                  ),
                ),
                SizedBox(height: 24.h),
                Divider(color: AppColors.whiteColor),
                SizedBox(height: 24.h),
                DrawerSettingsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
