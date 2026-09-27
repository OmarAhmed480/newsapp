import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/ui/home/category/category_fragment/widget/categoryItem.dart';
import 'package:newsapp/utils/app_Assets.dart';
import 'package:provider/provider.dart';
import '../../../../model/categoryModel.dart';
import '../../../../provider/app_language_provider.dart';
import '../../../../provider/app_them_provider.dart';
import '../../../../utils/app_Style.dart';


typedef OnCategoryItemClick = void Function({required CategoryModel newCategory});

class CategoryFragment extends StatefulWidget {
  CategoryFragment({super.key, required this.onCategoryItemClick});

  final OnCategoryItemClick onCategoryItemClick;
  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> itemList = [
      CategoryModel(
        id: "general",
        title: AppLocalizations.of(context)!.general,
        image: AppAssets.rectangle_1,
      ),
      CategoryModel(
        id: "business",
        title: AppLocalizations.of(context)!.business,
        image: AppAssets.rectangle_2,
      ),
      CategoryModel(
        id: "sport",
        title: AppLocalizations.of(context)!.sport,
        image: AppAssets.rectangle_7,
      ),
      CategoryModel(
        id: "technology",
        title: AppLocalizations.of(context)!.technology,
        image: AppAssets.rectangle_6,
      ),
      CategoryModel(
        id: "entertainment",
        title: AppLocalizations.of(context)!.entertainment,
        image: AppAssets.rectangle_3,
      ),
      CategoryModel(
        id: "health",
        title: AppLocalizations.of(context)!.health,
        image: AppAssets.rectangle_4,
      ),
      CategoryModel(
        id: "science",
        title: AppLocalizations.of(context)!.science,
        image: AppAssets.rectangle_5,
      ),
    ];
    var themProvider = Provider.of<AppThemProvider>(context);
    var isDark = themProvider.isDark();
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var isLanguage = languageProvider.appLanguage == "en";

    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.goodMorning,
            style: isDark
                ? AppStyle.medium14whiteColor.copyWith(fontSize: 24.sp)
                : AppStyle.medium14blackColor.copyWith(fontSize: 24.sp),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    widget.onCategoryItemClick(
                      newCategory: itemList[index],
                    );
                  },
                  child: CategoryItem(
                    image: itemList[index].image,
                    title: itemList[index].title,
                    buttonTitle: AppLocalizations.of(context)!.viewAll,
                    isDark: isDark,
                    isLanguage: isLanguage,
                    isRtl: index.isOdd,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
