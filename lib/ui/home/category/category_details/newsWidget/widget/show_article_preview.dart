import 'package:flutter/material.dart';
import 'package:newsapp/model/news/Articles.dart';
import 'package:newsapp/ui/home/category/category_details/newsWidget/widget/articlePreviewBottomSheet.dart';

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