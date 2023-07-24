import 'package:meal/main.dart';
import 'package:flutter/material.dart';
import 'package:meal/models/meals.dart';
import 'package:meal/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailedScreen extends StatelessWidget{
  const MealDetailedScreen({super.key, required this.meal, required this.onToggleFavorit});
  final Meal meal;
  final void Function(Meal meal) onToggleFavorit;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
          onToggleFavorit(meal);
          }, icon: const Icon(Icons.star))
        ],
        title: Text(meal.title
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
            ),
            const SizedBox(height: 15),
            Text('Ingredients',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
             color: Theme.of(context).colorScheme.primary,
             fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 15),
            for(final ingredient in meal.ingredients)
            Text(ingredient,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
             color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            const SizedBox(height: 10),
            Text('Steps',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
             color: Theme.of(context).colorScheme.primary,
             fontWeight: FontWeight.bold,
            ),
            ),
             const SizedBox(height: 15),
            for(final step in meal.steps)
            Text(step,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
             color: Theme.of(context).colorScheme.onBackground,
             ),
             textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}