// This screen is the UI for how every meal Screen would look like

import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key, this.categoryTitle, required this.meals});

  final String? categoryTitle;

  final List<Meal> meals;



  // final List<Meals>

 void _selectedMeal(BuildContext context,Meal meal){
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return MealDetailsScreen(meal: meal);
  },));
 }

  @override
  Widget build(context) {
    // This if-else is related to setting the App bar as with the logic in tabsScreen, we were getting two app bars on My Favorites
    if (categoryTitle== null){
      return Scaffold(
      
      body: meals.isEmpty
          ? Center(
              child: Column(
                
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Text('Uh oh!... No meals in this section', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground, fontSize: 25),),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Try selecting a different section',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                )
              ],
                          ))
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) => MealItem(meal: meals[index], selectedMeal: (meal){
                _selectedMeal(context, meal);
              },)),
    );
    } 
    else{
      return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: meals.isEmpty
          ? Center(
              child: Column(
                
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Text('Uh oh!... No meals in this section', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground, fontSize: 25),),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Try selecting a different section',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                )
              ],
                          ))
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) => MealItem(meal: meals[index], selectedMeal: (meal){
                _selectedMeal(context, meal);
              },)),
    ); 
  }
}
}