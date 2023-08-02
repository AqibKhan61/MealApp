import 'package:flutter/material.dart';
import 'package:meal/models/meals.dart';
import 'package:meal/Screens/Mealss.dart';
import 'package:meal/Data/dummy_data.dart';
import 'package:meal/models/categogriess.dart';
import 'package:meal/Widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationcontroller;

  @override
  void initState() {
    super.initState();

    _animationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      upperBound: 1,
      lowerBound: 0,
    );
    _animationcontroller.forward();
  }

  @override
  void dispose() {
    _animationcontroller.dispose();
    super.dispose();
  }

  void _SelectedCategory(BuildContext context, Category category) {
    final filteredmeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealScreen(
              title: category.title,
              meals: filteredmeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationcontroller,
      child: GridView(
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
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationcontroller,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );
  }
}
