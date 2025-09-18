import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_list.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  late Future<List<ArticleModel>> articles;
  @override
  void initState() {
    super.initState();
    articles = NewsService(dio: Dio()).getNewsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsList(
            articlesList: snapshot.data ?? [],
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Oops, there is an Error !'),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.orangeAccent,
                rightDotColor: Colors.orange.shade700,
                size: 60,
              ),
            ),
          );
        }
      },
    );
  }
}
