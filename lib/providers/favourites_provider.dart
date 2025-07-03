import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteMeals extends StateNotifier<List<Meal>> {
  FavouriteMeals() : super([]);

  bool toggleMealFavouriteMeal(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealProvider = StateNotifierProvider<FavouriteMeals, List<Meal>>(
  (ref) => FavouriteMeals(),
);
