import 'package:flutter/material.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/articlePreviewBottomSheet.dart';
import '../../../../../../api/model/news/Articles.dart';

void showArticlePreview({
  required BuildContext context,
  required Articles article,
  required bool isDark,
  required VoidCallback onViewFullArticle,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ArticlePreviewBottomSheet(
        article: article,
        isDark: isDark,
        onViewFullArticle: onViewFullArticle,
      );
    },
  );
}