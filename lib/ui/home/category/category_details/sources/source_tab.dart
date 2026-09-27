import 'package:flutter/material.dart';
import 'package:newsapp/ui/home/category/category_details/sources/sourceName.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../../api/model/sources/source.dart';
import '../../../../../provider/app_them_provider.dart';
import '../newsWidget/newsWidget.dart';

class SourceTab extends StatefulWidget {
 SourceTab({super.key, required this.sourceList});

 List<Sources> sourceList;

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int isSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemProvider>(context);
    var isDark = themeProvider.isDark();

    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            indicatorColor: isDark
                ? AppColors.whiteColor
                : AppColors.blackColor,

            isScrollable: true,

            onTap: (index) {
              setState(() {
                isSelectedIndex = index;
              });
            },

            tabs: widget.sourceList.map((source) {
              return SourceName(
                source: source,
                isSelected:
                    isSelectedIndex == widget.sourceList.indexOf(source),
                isDark: isDark,
              );
            }).toList(),
          ),
          Expanded(child: NewsWidget(source:widget.sourceList[isSelectedIndex])),
        ],
      ),
    );
  }
}
