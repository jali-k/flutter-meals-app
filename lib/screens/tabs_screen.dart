import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourite_provider.dart';
import 'package:meals_app/providers/filter_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedIndex = 0;
  Widget? activeScren;
  String title = "Select Your Category";

  // final Map<Filter, bool> _selectedFilters = {
  //   Filter.gluteinFree: false,
  //   Filter.lactoseFree: false,
  //   Filter.vegetarian: false,
  //   Filter.vegan: false,
  // };

  List<Meal> favouriteMeals = [];

  void showSnackBarMessage(String message) {}

  void onSelectIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

// Navigation with the side drawer
  void _onSelectDrawerItem(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    final activeFilters = ref.watch(filtersProvider);

    List<Meal> filteredMeals = meals.where(
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

    // Handle the Tab bar behaviour
    if (selectedIndex == 0) {
      activeScren = CategoriesScreen(availableMeals: filteredMeals);
    } else {
      title = "Your Favourites";
      activeScren = MealsScreen(
        meals: ref.watch(favouriteMealsProvider),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MainDrawer(onselectDrawerItem: _onSelectDrawerItem),
      body: activeScren,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onSelectIndex,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
    );
  }
}
