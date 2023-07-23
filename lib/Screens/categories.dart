import 'package:flutter/material.dart';
import 'package:meal/Screens/Mealss.dart';
import 'package:meal/Data/dummy_data.dart';
import 'package:meal/Widgets/category_grid_item.dart';



class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key});

  void _SelectedCategory(BuildContext context){
     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const MealScreen(title: 'Some Categories',
      meals: [])));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Select the Item'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
      childAspectRatio: 1.5,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      ),
      children:  [
        for(final category in availableCategories )
        CategoryGridItem(category: category, onSelected: () => _SelectedCategory(context),),
      ],
      ),
      
    );
  }
}