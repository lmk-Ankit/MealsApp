import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid.dart';

class CategoriesScreen extends StatefulWidget {
 const CategoriesScreen({
    super.key,
   // required this.onToggleFavourite,
    required this.availableMeals,
  });
  

  //final void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  void _selectCategory(BuildContext context, Category category) {
    final filteredmeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredmeals,
         /// onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
    // or
    //Navigator.of(context).push(route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // Using the availableCategories from dummy_data.dart
        // to create a grid of CategoryGridItem widgets.
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
        // Alternatively, you can use a for loop to achieve the same result.
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
