import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class MealsScreen extends StatefulWidget {
  static const routeName = '/meals';
  final List<Meal> availableMeals;

  MealsScreen(this.availableMeals);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @required
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _deleteMeal(String deletingId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == deletingId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView(
        children: displayedMeals
            .map(
              (meal) => MealItem(
                id: meal.id,
                title: meal.title,
                affordability: meal.affordability,
                complexity: meal.complexity,
                duration: meal.duration,
                imageUrl: meal.imageUrl,
                deleteMeal: _deleteMeal,
              ),
            )
            .toList(),
      ),
    );
  }
}
