import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _setGlutienFree = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
        ],
      ),
    );
  }
}
