import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';


const kInitialFilters = {
  Filter.glutenFree: false ,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false
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

  Map<Filter, bool> _selectedFilters = kInitialFilters;

  
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(builder: (context){
          return FiltersScreen(currentFilters: _selectedFilters);
        })
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
      
      // print(result);

      
    }
  }


  

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    
    final filteredMealsByDiet = meals.where((meal){
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }

      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }

      if(_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }

      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }

      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
      
      filteredMealsByDiet: filteredMealsByDiet,
    );
    var activePageTitle = 'Categories';

    final favoriteMeals = ref.watch(favoriteMealsProvider);
    if (_selectedPageIndex == 1) {

      activeScreen = MealsScreen(
        meals: favoriteMeals,
        
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        setScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'My Favorites')
        ],
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
