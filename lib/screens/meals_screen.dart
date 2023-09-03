import 'package:flutter/material.dart';
import 'package:meals_app/models/Meal.dart';

import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("No meals here"),
        Text("Try selecting a deferent category")
      ],
    );

    if (meals.isNotEmpty) {
      bodyContent = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final meal in meals)
            MealItem(
              meal: meal,
            )
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: bodyContent);
  }
}
