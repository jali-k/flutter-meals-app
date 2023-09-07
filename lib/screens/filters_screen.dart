import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filter_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _setGlutienFree =
      false; // widget key word is not available here where you initialize the state variables. It is available in the build method and also in "InitState()"
  var _setLactoseFree = false;
  var _setVegetarian = false;
  var _setVegan = false;

  @override
  void initState() {
    final activeFilters = ref.read(filtersProvider);
    _setGlutienFree = activeFilters[Filter.gluteinFree]!;
    _setLactoseFree = activeFilters[Filter.lactoseFree]!;
    _setVegetarian = activeFilters[Filter.vegetarian]!;
    _setVegan = activeFilters[Filter.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        ref.watch(filtersProvider.notifier).updateFilters({
          Filter.gluteinFree: _setGlutienFree,
          Filter.lactoseFree: _setLactoseFree,
          Filter.vegetarian: _setVegetarian,
          Filter.vegan: _setVegan,
        });
        return true;
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
