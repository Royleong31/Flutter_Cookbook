import 'package:flutter/material.dart';
import '../components/category_Item.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES
          .map((cat) => CategoryItem(
                color: cat.color,
                title: cat.title,
                id: cat.id,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
