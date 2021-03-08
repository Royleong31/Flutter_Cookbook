import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return favouriteMeals.isEmpty
        ? Center(
            child: Text('No favourites yet! Start adding some!',
                style: TextStyle(fontSize: 18)),
          )
        : ListView(
            children: favouriteMeals
                .map(
                  (meal) => MealItem(
                    id: meal.id,
                    title: meal.title,
                    affordability: meal.affordability,
                    complexity: meal.complexity,
                    duration: meal.duration,
                    imageUrl: meal.imageUrl,
                  ),
                )
                .toList(),
          );
  }
}
