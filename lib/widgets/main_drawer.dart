import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onselectDrawerItem});

  final void Function(String identifier) onselectDrawerItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Coocking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.food_bank_outlined),
            title: Text(
              "Categories",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              onselectDrawerItem('categories');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              "Filters",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              onselectDrawerItem('filters');
            },
          ),
        ],
      ),
    );
  }
}
