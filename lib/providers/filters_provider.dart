import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';


enum Filter{glutenFree ,lactoseFree, vegetarian, vegan}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>>{
  FiltersNotifier() : super({
    Filter.glutenFree : false,
    Filter.lactoseFree : false,
    Filter.vegetarian : false,
    Filter.vegan : false,
  });

  void setFilters(Map<Filter, bool> filters){
    state = filters;
  }

  void setFilter(Filter filter, bool isActive){
    state = {
      ...state,
      filter : isActive
    };
  }
}

final filterProvier = StateNotifierProvider<FiltersNotifier ,Map<Filter, bool>>(
  (ref){
    return FiltersNotifier();
  }
);

final filterMealsProvider = Provider((ref){
  final meals = ref.read(mealsProvider);
  final activeFilter = ref.watch(filterProvier);
  return meals.where((meal){
      if(activeFilter[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(activeFilter[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(activeFilter[Filter.vegan]! && !meal.isVegan){
        return false;
      }

      return true;
    }).toList();
});