import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/utils/app_Style.dart';
import 'package:newsapp/utils/app_colors.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDark;
  final VoidCallback? onSearchPressed;

  const NewsAppBar({super.key, required this.isDark, this.onSearchPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDark ? AppColors.blackColor : AppColors.whiteColor,

      iconTheme: IconThemeData(
        color: isDark ? AppColors.whiteColor : AppColors.blackColor,
      ),

      actions: [
        IconButton(
          onPressed: onSearchPressed,
          icon: Icon(Icons.search, size: 30.sp),
        ),
      ],
      centerTitle: true,
      title: Text(
        AppLocalizations.of(context)!.home,
        style: isDark
            ? AppStyle.medium14whiteColor.copyWith(fontSize: 20.sp)
            : AppStyle.medium14blackColor.copyWith(fontSize: 20.sp),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
