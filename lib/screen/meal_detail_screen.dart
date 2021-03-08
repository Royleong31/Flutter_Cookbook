import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavourite;
  final Function isMealFavourite;
  MealDetailScreen(this.toggleFavourite, this.isMealFavourite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildContainerLabel(context, text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(text, style: Theme.of(context).textTheme.headline6),
      );
    }

    Widget buildContainer(child) {
      return Container(
        height: 150,
        width: 300,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildContainerLabel(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, ind) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(selectedMeal.ingredients[ind]),
                  ),
                );
              },
            )),
            buildContainerLabel(context, 'Steps'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (context, ind) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${ind + 1}'),
                      ),
                      title: Text('${selectedMeal.steps[ind]}'),
                    ),
                    Divider(),
                  ],
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isMealFavourite(mealId) ? Icons.star : Icons.star_border_outlined,
        ),
        // child: Icon(Icons.delete),
        // onPressed: () => Navigator.of(context).pop(mealId),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
