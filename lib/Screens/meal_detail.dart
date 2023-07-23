import 'package:flutter/material.dart';
import 'package:meal/models/meals.dart';
import 'package:meal/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailedScreen extends StatelessWidget{
  const MealDetailedScreen({super.key, required this.meal});
  final Meal meal;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title
        ),
      ),
      body: Image.network(meal.imageUrl,
      fit: BoxFit.cover,
      height: 300,
      width: double.infinity,
      ),
    );
  }
}