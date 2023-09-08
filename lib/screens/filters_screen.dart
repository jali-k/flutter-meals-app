import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Use Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            contentPadding: const EdgeInsets.only(left: 20, right: 16),
            value: activeFilters[Filter.gluteinFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filter.gluteinFree, isChecked);
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
            contentPadding: const EdgeInsets.only(left: 20, right: 16),
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filter.lactoseFree, isChecked);
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
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filter.vegetarian, isChecked);
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
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filter.vegan, isChecked);
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
    );
  }
}
