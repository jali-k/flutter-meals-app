import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';

enum Filter { gluteinFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key, required this.selectedFilters})
      : super(key: key);

  final Map<Filter, bool> selectedFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _setGlutienFree =
      false; // widget key word is not available here where you initialize the state variables. It is available in the build method and also in "InitState()"
  var _setLactoseFree = false;
  var _setVegetarian = false;
  var _setVegan = false;

  @override
  void initState() {
    _setGlutienFree = widget.selectedFilters[Filter.gluteinFree]!;
    _setLactoseFree = widget.selectedFilters[Filter.lactoseFree]!;
    _setVegetarian = widget.selectedFilters[Filter.vegetarian]!;
    _setVegan = widget.selectedFilters[Filter.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({
          Filter.gluteinFree: _setGlutienFree,
          Filter.lactoseFree: _setLactoseFree,
          Filter.vegetarian: _setVegetarian,
          Filter.vegan: _setVegan,
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Use Filters"),
        ),
        body: Column(
          children: [
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 16),
              value: _setGlutienFree,
              onChanged: (isChecked) {
                setState(() {
                  _setGlutienFree = isChecked;
                });
              },
              title: Text(
                "Is glutein free",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18),
              ),
              subtitle: Text(
                "Filter the glutein free mels",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 16),
              value: _setLactoseFree,
              onChanged: (isChecked) {
                setState(() {
                  _setLactoseFree = isChecked;
                });
              },
              title: Text(
                "Is lactose free",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18),
              ),
              subtitle: Text(
                "Filter the lactose free mels",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 16),
              value: _setVegetarian,
              onChanged: (isChecked) {
                setState(() {
                  _setVegetarian = isChecked;
                });
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18),
              ),
              subtitle: Text(
                "Filter the vegetarian mels",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 16),
              value: _setVegan,
              onChanged: (isChecked) {
                setState(() {
                  _setVegan = isChecked;
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18),
              ),
              subtitle: Text(
                "Filter the vegan mels",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
