import 'package:flutter/material.dart';
import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  Widget? activeScren;
  String title = "Select Your Category";

  List<Meal> favouriteMeals = [];

  void showSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _onToggleFavouriteMeals(Meal meal) {
    if (favouriteMeals.contains(meal)) {
      setState(() {
        favouriteMeals.remove(meal);
      });
      showSnackBarMessage("Meal is remove from favourites");
    } else {
      setState(() {
        favouriteMeals.add(meal);
      });
      showSnackBarMessage("Meal added as a favourite");
    }
  }

  void onSelectIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

// Navigation with the side drawer
  void _onSelectDrawerItem(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final filterValues = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(),
        ),
      );
      print(filterValues);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Handle the Tab bar behaviour
    if (selectedIndex == 0) {
      activeScren = CategoriesScreen(
        onToggleFavourites: _onToggleFavouriteMeals,
      );
    } else {
      title = "Your Favourites";
      activeScren = MealsScreen(
        meals: favouriteMeals,
        onToggleFavourites: _onToggleFavouriteMeals,
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
