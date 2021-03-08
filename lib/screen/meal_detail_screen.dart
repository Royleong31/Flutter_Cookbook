import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.where((meal) => meal.id == mealId).toList()[0];

    return Scaffold(
        appBar: AppBar(
          title: Text('sfad'),
        ),
        body: Text(selectedMeal.title));
  }
}
