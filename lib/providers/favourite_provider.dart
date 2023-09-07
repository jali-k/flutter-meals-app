import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier()
      : super(
            []); // We here pass the initial value for the provider "the initial favourite meals". This should not be changed and we need to replase it in a change.

  void _toggleFavouriteMeals(Meal meal) {
    final _isMealFavourite = state.contains(
        meal); // Here the state is the obj to access the initial list or the list that the current provider has. (Like widget keyword in statefull classes)
    if (_isMealFavourite) {
      // Here we need to remove the meal
      state = state
          .where((m) => m.id != meal.id)
          .toList(); // We return all meals without the one we received, creating a new list.
    } else {
      // Here we need to add the meal. Also we need to replace the existing list.
      state = [...state, meal];
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});
