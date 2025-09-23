import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<Category> categoryList = const [
    Category(
      name: 'Politics',
    ),
    Category(
      name: 'Business',
    ),
    Category(
      name: 'Sports',
    ),
    Category(
      name: 'Health',
    ),
    Category(
      name: 'Technology',
    ),
    Category(
      name: 'Science',
    ),
    Category(
      name: 'Education',
    ),
    Category(
      name: 'Crime',
    ),
    Category(
      name: 'Entertainment',
    ),
    Category(
      name: 'Tourism',
    ),
    Category(
      name: 'Other',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categoryList[index]);
        },
      ),
    );
  }
}
