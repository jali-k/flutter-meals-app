import 'package:flutter_riverpod/flutter_riverpod.dart';

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
