import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    // final mealTitle = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId).title;

    return Scaffold(
        appBar: AppBar(
          title: Text(mealId),
        ),
        body: Center(child: Text('The meal - $mealId!')));
  }
}
