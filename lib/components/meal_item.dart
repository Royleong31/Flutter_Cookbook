import 'package:flutter/material.dart';
import 'package:flutter_cookbook/models/meal.dart';

class MealItem extends StatelessWidget {
  String id;
  String title;
  String imageUrl;
  int duration;
  Complexity complexity;
  Affordability affordability;

  MealItem({
    this.id,
    this.imageUrl,
    this.title,
    this.duration,
    this.complexity,
    this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unkown';
    }
  }

  String get affodabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unkown';
    }
  }

  void selectMeal(context) {
    Navigator.of(context).pushNamed(
      '/meal-detail',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    // width: 200,
                    child: Container(
                      width: 300,
                      child: Text(
                        title,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule),
                          SizedBox(
                            width: 3,
                          ),
                          Text('$duration min'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.attach_money_sharp),
                          SizedBox(
                              // width: 3,
                              ),
                          Text('$affodabilityText'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(
                            width: 3,
                          ),
                          Text('$complexityText'),
                        ],
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
