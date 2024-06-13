import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    
    final mealIsFavorite = state.contains(meal);
    if(mealIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }else{
      state = [...state,meal];
      return true;
    }

    
  }

}
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});




// Initialization: When the app starts, FavoriteMealsNotifier is created with an empty list of favorite meals.
// Toggling Favorites:
// When toggleMealFavoriteStatus is called with a meal, it checks if the meal is already in the favorites list.
// If it is, it removes the meal.
// If it isn't, it adds the meal.
// The state is updated accordingly, which triggers the UI to update.