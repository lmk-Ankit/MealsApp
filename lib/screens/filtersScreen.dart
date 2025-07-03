// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});
  // final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FilterScreen> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends ConsumerState<FilterScreen> {
  var _glutenfree = false;
  var _lactosefree = false;
  var _vegan = false;
  var _exotic = false;
  var _nonveg = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filterProvider);
    _glutenfree = activeFilters[Filter.glutenFree]!;
    _lactosefree = activeFilters[Filter.lactoseFree]!;
    _vegan = activeFilters[Filter.vegan]!;
    _exotic = activeFilters[Filter.exotic]!;
    _nonveg = activeFilters[Filter.nonvegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    final Texttheme = Theme.of(context).textTheme;
    final Colortheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      // drawer: MealsDrawer(
      //   onFilterSelected: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(
      //         context,
      //       ).push(MaterialPageRoute(builder: (context) => TabsScreen(),
      //       ),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
//          if (didPop) return;
          ref.read(filterProvider.notifier).setFilters({
                 Filter.glutenFree: _glutenfree,
            Filter.lactoseFree: _lactosefree,
            Filter.vegan: _vegan,
            Filter.nonvegetarian: _nonveg,
            Filter.exotic: _exotic,
          });
          // Navigator.of(context).pop({
          // });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenfree,
              onChanged: (ischecked) {
                setState(() {
                  _glutenfree = ischecked;
                });
              },
              title: Text(
                'Glutern -free',
                style: Texttheme.titleLarge!.copyWith(
                  color: Colortheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include Glutten-Free meals',
                style: Texttheme.labelMedium!.copyWith(
                  color: Colortheme.onSurface,
                ),
              ),
              activeColor: Colortheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactosefree,
              onChanged: (ischecked) {
                setState(() {
                  _lactosefree = ischecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Texttheme.titleLarge!.copyWith(
                  color: Colortheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include Lactose-Free meals',
                style: Texttheme.labelMedium!.copyWith(
                  color: Colortheme.onSurface,
                ),
              ),
              activeColor: Colortheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegan,
              onChanged: (ischecked) {
                setState(() {
                  _vegan = ischecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Texttheme.titleLarge!.copyWith(
                  color: Colortheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Texttheme.labelMedium!.copyWith(
                  color: Colortheme.onSurface,
                ),
              ),
              activeColor: Colortheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _nonveg,
              onChanged: (ischecked) {
                setState(() {
                  _nonveg = ischecked;
                });
              },
              title: Text(
                'Non-Vegeterian',
                style: Texttheme.titleLarge!.copyWith(
                  color: Colortheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include Non-Veg meals',
                style: Texttheme.labelMedium!.copyWith(
                  color: Colortheme.onSurface,
                ),
              ),
              activeColor: Colortheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _exotic,
              onChanged: (ischecked) {
                setState(() {
                  _exotic = ischecked;
                });
              },
              title: Text(
                'Luxurious',
                style: Texttheme.titleLarge!.copyWith(
                  color: Colortheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include expensive meals',
                style: Texttheme.labelMedium!.copyWith(
                  color: Colortheme.onSurface,
                ),
              ),
              activeColor: Colortheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
