import 'package:flutter/material.dart';
import 'package:meal/models/meals.dart';
import 'package:meal/Screens/Mealss.dart';
import 'package:meal/Data/dummy_data.dart';
import 'package:meal/Screens/categories.dart';
import 'package:meal/Widgets/main_drawer.dart';
import 'package:meal/Screens/filters_Screen.dart';

final kinitialFiters = {
  Filters.Glutenfree: false,
  Filters.Lactosefree: false,
  Filters.Vegetarian: false,
  Filters.Vegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _SelectedPageIndex = 0;
  final List<Meal> _favoritesMeal = [];
  Map<Filters, bool> _selectedFilters = kinitialFiters;

  void _FavoriteInfo(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _MealfavoriteStatus(Meal meal) {
    final isExisting = _favoritesMeal.contains(meal);
    if (isExisting) {
      setState(() {
        _favoritesMeal.remove(meal);
      });
      _FavoriteInfo('This food is No longer favorite!');
    } else {
      setState(() {
        _favoritesMeal.add(meal);
        _FavoriteInfo('Added to favorite!');
      });
    }
  }

  void selectedpage(int index) {
    setState(() {
      _SelectedPageIndex = index;
    });
  }

  void _onselectfilters(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>  FiltersScreen(currentFilter: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kinitialFiters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where(
      (meal) {
        if (_selectedFilters[Filters.Glutenfree]! && !meal.isGlutenFree) {
          return false;
        }
        if (_selectedFilters[Filters.Lactosefree]! && !meal.isLactoseFree) {
          return false;
        }
        if (_selectedFilters[Filters.Vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (_selectedFilters[Filters.Vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();
    Widget activePage = CategoriesScreen(
      onToggleFavorit: _MealfavoriteStatus,
      availableMeals: availableMeals,
    );
    var activepageTitle = 'Categories';
    if (_SelectedPageIndex == 1) {
      activePage = MealScreen(
        meals: _favoritesMeal,
        onToggleFavorit: _MealfavoriteStatus,
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
