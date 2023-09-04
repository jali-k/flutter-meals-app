import 'package:flutter/material.dart';
import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void onSelectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal: meal),
      ),
    );
  }

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
      bodyContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: onSelectMeal,
        ),
      );

      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final meal in meals)
            MealItem(
              meal: meal,
              onSelectMeal: onSelectMeal,
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
