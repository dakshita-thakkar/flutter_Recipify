// import 'package:flutter_riverpod/flutter_riverpod.dart';





// class FiltersNotifier extends StateNotifier<Map<Filter, bool>>{
//   FiltersNotifier() : super({
//     Filter.glutenFree : false,
//     Filter.lactoseFree : false,
//     Filter.vegan : false,
//     Filter.vegetarian : false
  
//   });

//   void setAllFilters(Map<Filter, bool> chosenFilters){
//     state = chosenFilters;
//   }

//   void setFilter(Filter filter, bool isActive){
    
    
//     state = {
//       ...state,filter:isActive
//     };
//   }
// }




// final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) => FiltersNotifier());



// This logic was discarded as it did not work well with PopScope widget 