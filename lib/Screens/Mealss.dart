import 'package:flutter/material.dart';
import 'package:meal/models/meals.dart';

class MealScreen extends StatelessWidget{
  const  MealScreen({
    super.key,
    required this.title,
    required this.meals,
    });

    final String title;
    final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content =  ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => Text(meals[index].title),
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