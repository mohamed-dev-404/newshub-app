import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    super.key,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(category: category.name);
            },
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 12),
        width: 130,
        height: 40,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange,
              Colors.orangeAccent,
              Colors.deepOrange,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Text(
          category.name,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
