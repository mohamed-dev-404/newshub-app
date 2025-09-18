import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_builder.dart';
import 'package:news_app/widgets/logo.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Logo(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            NewsListBuilder(
              category: category,
            ),
          ],
        ),
      ),
    );
  }
}
