import 'package:flutter/material.dart';
import 'package:meal/Screens/Mealss.dart';
import 'package:meal/Screens/categories.dart';
import 'package:meal/Widgets/main_drawer.dart';
import 'package:meal/Screens/filters_Screen.dart';
import 'package:meal/providers/favorite_meal.dart';
import 'package:meal/Providers/filters-Provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import'package:meal/Providers/meals_provider.dart';

final kinitialFiters = {
  Filters.Glutenfree: false,
  Filters.Lactosefree: false,
  Filters.Vegetarian: false,
  Filters.Vegan: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _SelectedPageIndex = 0;
 // final List<Meal> _favoritesMeal = [];
  



  // void _MealfavoriteStatus(Meal meal) {
  //   final isExisting = _favoritesMeal.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favoritesMeal.remove(meal);
  //     });
  //     _FavoriteInfo('This food is No longer favorite!');
  //   } else {
  //     setState(() {
  //       _favoritesMeal.add(meal);
  //       _FavoriteInfo('Added to favorite!');
  //     });
  //   }
  // }

  void selectedpage(int index) {
    setState(() {
      _SelectedPageIndex = index;
    });
  }

  void _onselectfilters(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>  const FiltersScreen(),
        ),
      );
  }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealProvider);
    final acticefilter = ref.watch(filtersProvider);
    final availableMeals = meals.where(
      (meal) {
        if (acticefilter[Filters.Glutenfree]! && !meal.isGlutenFree) {
          return false;
        }
        if (acticefilter[Filters.Lactosefree]! && !meal.isLactoseFree) {
          return false;
        }
        if (acticefilter[Filters.Vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (acticefilter[Filters.Vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();
    Widget activePage = CategoriesScreen(
      
      availableMeals: availableMeals,
    );
    var activepageTitle = 'Categories';
    if (_SelectedPageIndex == 1) {
      final favoritesMeals = ref.watch(favoriteMealProvider);
      activePage = MealScreen(
        meals: favoritesMeals,
        
      );
      activepageTitle = 'Your Favorites!';
    }
    return Scaffold(
      drawer: MainDrawer(selectedFilters: _onselectfilters),
      appBar: AppBar(
        title: Text(
          activepageTitle,
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _SelectedPageIndex,
          onTap: selectedpage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
    );
  }
}
