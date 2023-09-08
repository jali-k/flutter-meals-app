import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter { gluteinFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.gluteinFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  // Changing the filters

  void updateFilters(Map<Filter, bool> updatedFilters) {
    state = updatedFilters;
  }

  void updateFilter(Filter filter, bool newState) {
    state = {...state, filter: newState};
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
  (ref) {
    return FilterNotifier();
  },
);

// Add another provider which gives the filterred meals

final filteredMealsProvider = Provider((ref) {
// meals are from the meals provider

  final meals = ref.watch(mealsProvider);

  // active filters are depende on filtersProvider

  final activeFilters = ref.watch(filtersProvider);

  return meals.where(
    (meal) {
      if (activeFilters[Filter.gluteinFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    },
  ).toList();
});
