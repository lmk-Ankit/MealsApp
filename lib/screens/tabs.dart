import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filtersScreen.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

const kallFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.nonvegetarian: false,
  Filter.exotic: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  //final List<Meal> _favoriteMeals = [];

  // void showMessage(String message) {
  //   // To show a message when star is pressed
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text(message)));
  // }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) => const FilterScreen()),
      );
    }
  }

  // void _addorRemoveMeal(Meal meal) {
  //   final isPresent = _favoriteMeals.contains(meal); // check true or false

  //   if (isPresent) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //     });
  //     showMessage('Item removed from favourites');
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //     });
  //     showMessage('Item added to favourites');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final activeFilters = ref.watch(filterProvider);
    final availableMeals = dummyMeals.where((meal) {
      if ((activeFilters[Filter.glutenFree] ?? false) && !meal.isGlutenFree) {
        return false;
      }
      if ((activeFilters[Filter.lactoseFree] ?? false) && !meal.isLactoseFree) {
        return false;
      }
      if ((activeFilters[Filter.vegan] ?? false) && !meal.isVegan) {
        return false;
      }
      if ((activeFilters[Filter.nonvegetarian] ?? false) &&
          !meal.isNonVegetarian) {
        return false;
      }
      if ((activeFilters[Filter.exotic] ?? false) && !meal.isExotic) {
        return false;
      }
      return true;
    }).toList();

    Widget activepage = CategoriesScreen(
      //onToggleFavourite: _addorRemoveMeal,
      availableMeals: availableMeals,
    );
    var activepageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealProvider);
      activepage = MealsScreen(
        meals: favouriteMeals,
        // onToggleFavourite: _addorRemoveMeal,
      );
      activepageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activepageTitle)),
      drawer: MealsDrawer(onFilterSelected: _setScreen),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
