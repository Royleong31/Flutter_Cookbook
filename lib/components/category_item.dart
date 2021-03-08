import 'package:flutter/material.dart';
import 'package:flutter_cookbook/screen/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem({this.title, this.color, this.id});

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(
    //     builder: (_) => MealsScreen(
    //           categoryId: id,
    //           categoryTitle: title,
    //         )));

    Navigator.of(ctx).pushNamed(
      MealsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      highlightColor: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [color.withOpacity(0.5), color],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
