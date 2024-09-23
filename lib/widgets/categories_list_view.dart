import 'package:flutter/material.dart';
import '../Models/category_model.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});

  final List<CategoryModel> categoryList = [
    CategoryModel(image: 'Assets/technology.jpeg', catName: 'Technology'),
    CategoryModel(image: 'Assets/business.jpg', catName: 'Business'),
    CategoryModel(image: 'Assets/entertainment.jpg', catName: 'Entertainment'),
    CategoryModel(image: 'Assets/health.jpg', catName: 'Health'),
    CategoryModel(image: 'Assets/science.jpg', catName: 'Science'),
    CategoryModel(image: 'Assets/sports.jpg', catName: 'Sports'),
    CategoryModel(image: 'Assets/general.jpg', catName: 'General'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              cat: categoryList[index],
            );
          }),
    );
  }
}
