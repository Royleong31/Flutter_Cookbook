import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../components/meal_item.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = '/meals';
  final String categoryId;
  final String categoryTitle;
  MealsScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView(
        children: categoryMeals
            .map((meal) => MealItem(
                  id: meal.id,
                  title: meal.title,
                  affordability: meal.affordability,
                  complexity: meal.complexity,
                  duration: meal.duration,
                  imageUrl: meal.imageUrl,
                ))
            .toList(),
      ),
    );
  }
}
