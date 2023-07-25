import 'package:flutter/material.dart';
import 'package:meal/models/meals.dart';
import 'package:meal/Screens/Mealss.dart';
import 'package:meal/Data/dummy_data.dart';
import 'package:meal/models/categogriess.dart';
import 'package:meal/Widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorit, required this.availableMeals});
  final void Function(Meal meal) onToggleFavorit;
  final List<Meal> availableMeals;

  void _SelectedCategory(BuildContext context, Category category) {
    final filteredmeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealScreen(
              title: category.title,
              meals: filteredmeals,
              onToggleFavorit: onToggleFavorit,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelected: () => _SelectedCategory(context, category),
          ),
      ],
    );
  }
}
