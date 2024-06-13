//  This file is the blueprint of the drawer displayed on both categories and favorites screen

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.setScreen});
  final void Function(String identifier) setScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_rounded,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Recipify!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            )),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24),
          ),
          onTap: () {
            setScreen('meals');
          },
        ),

        ListTile(
          leading: Icon(
            Icons.filter_alt_rounded,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24),
          ),
          onTap: () {
            setScreen('filters');
          },
        ),
      ],
    ));
  }
}
