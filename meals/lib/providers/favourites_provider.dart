import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteMealsProvider extends StateNotifier<List<Meal>> {
  FavouriteMealsProvider() : super([]);
  bool toggleFavouriteMealStatus(Meal meal) {
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

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsProvider, List<Meal>>((ref) {
  return FavouriteMealsProvider();
});
