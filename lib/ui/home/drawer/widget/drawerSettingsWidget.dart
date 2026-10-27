import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/provider/app_language_provider.dart';
import 'package:newsapp/provider/app_them_provider.dart';
import 'package:newsapp/utils/app_Assets.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:newsapp/utils/app_Style.dart';
import 'package:provider/provider.dart';
import 'customDropdownWidget.dart';
import 'customImageTextWidget.dart';

class DrawerSettingsWidget extends StatelessWidget {
  const DrawerSettingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    var isDark = themeProvider.isDark();

    return Column(
      children: [

        // Theme
        CustomImageTextWidget(
          image: AppAssets.them,
          text: AppLocalizations.of(context)!.them,
        ),
        SizedBox(height: 8.h),

        CustomDropdownWidget(
          iconSize: 30.sp,
          darkIconColor: AppColors.whiteColor,
          lightIconColor: AppColors.whiteColor,
          darkDropdownColor: AppColors.blackColor,
          lightDropdownColor: AppColors.blackColor,
          darkStyle: AppStyle.bold16whiteColor,
          lightStyle: AppStyle.bold16whiteColor,
          isDark: isDark,

          initialValue: isDark
              ? AppLocalizations.of(context)!.dark
              : AppLocalizations.of(context)!.light,

          items: [
            DropdownMenuItem(
              value: AppLocalizations.of(context)!.dark,
              child: Text(
                AppLocalizations.of(context)!.dark,
              ),
            ),
            DropdownMenuItem(
              value: AppLocalizations.of(context)!.light,
              child: Text(
                AppLocalizations.of(context)!.light,
              ),
            ),
          ],

          onChanged: (value) {
            if (value == AppLocalizations.of(context)!.dark) {
              themeProvider.changThem(ThemeMode.dark);
            } else {
              themeProvider.changThem(ThemeMode.light);
            }
          },
        ),

        SizedBox(height: 24.h),

        Divider(
          color: AppColors.whiteColor,
        ),

        SizedBox(height: 24.h),

        // Language
        CustomImageTextWidget(
          image: AppAssets.language,
          text: AppLocalizations.of(context)!.language,
        ),

        SizedBox(height: 8.h),

        Padding(
          padding: languageProvider.appLanguage == "en"
              ? REdgeInsets.only(right: 100)
              : REdgeInsets.only(left: 100),

          child: SizedBox(
            width: 130.w,

            child: CustomDropdownWidget(
              iconSize: 30.sp,
              darkIconColor: AppColors.whiteColor,
              lightIconColor: AppColors.whiteColor,
              darkDropdownColor: AppColors.blackColor,
              lightDropdownColor: AppColors.blackColor,
              darkStyle: AppStyle.bold16whiteColor,
              lightStyle: AppStyle.bold16whiteColor,
              isDark: isDark,

              initialValue: languageProvider.appLanguage,

              items: [
                DropdownMenuItem(
                  value: "en",
                  child: Text(
                    AppLocalizations.of(context)!.english,
                  ),
                ),
                DropdownMenuItem(
                  value: "ar",
                  child: Text(
                    AppLocalizations.of(context)!.arabic,
                  ),
                ),
              ],

              onChanged: (value) {
                if (value == "en") {
                  languageProvider.changLanguage("en");
                } else {
                  languageProvider.changLanguage("ar");
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}