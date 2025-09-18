import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    required this.articlesList,
    super.key,
  });

  final List<ArticleModel> articlesList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articlesList.length,
        (context, index) {
          return NewsCard(
            article: articlesList[index],
          );
        },
      ),
    );
  }
}
