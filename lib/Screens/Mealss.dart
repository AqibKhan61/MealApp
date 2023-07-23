import 'package:flutter/material.dart';
import 'package:meal/models/meals.dart';
import 'package:meal/Widgets/meal_item.dart';
import 'package:meal/Screens/meal_detail.dart';

class MealScreen extends StatelessWidget{
  const  MealScreen({
    super.key,
    required this.title,
    required this.meals,
    });

    final String title;
    final List<Meal> meals;

    void SelectedMeal(BuildContext context, Meal meal){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetailedScreen(meal: meal)));
    }
  @override
  Widget build(BuildContext context) {
    Widget content =  ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => Mealitems(meal: meals[index], onSelectMeal: (meal){
        SelectedMeal(context, meal);
      }),
      );
      if (meals.isEmpty){
        content = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Oh...Uh there is nothing!!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),
              ),
              const SizedBox(height: 20),
              Text('Try to Add Some Meals',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),
              )
            ],
          ) ,
        );
      }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }}