import 'package:flutter/material.dart';

class MealsDrawer extends StatelessWidget {
  final void Function(String identifier) onFilterSelected;

  const MealsDrawer({super.key, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.restaurant_menu,
                  size: 48,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 16),
                Text(
                  'Meal Filters',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 25,
              color: theme.colorScheme.onSurface,
            ),
            title: Text(
              'Meals',
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onFilterSelected('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 25,
              color: theme.colorScheme.onSurface,
            ),
            title: Text(
              'Filters',
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onFilterSelected('filters');
            },
          ),
        ],
      ),
    );
  }
}
