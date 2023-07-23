import 'package:flutter/material.dart';
import 'package:meal/Screens/Mealss.dart';
import 'package:meal/Screens/categories.dart';

class TabScreen extends StatefulWidget{
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  
  }

}

class _TabScreenState extends State<TabScreen>{
int _SelectedPageIndex = 0;
void selectedpage(int index){
  setState(() {
    _SelectedPageIndex = index;
  });
}
  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activepageTitle = 'Categories';
    if (_SelectedPageIndex == 1){
      activePage = const MealScreen(meals: []);
      activepageTitle = 'Your Favorites!';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepageTitle,
      ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _SelectedPageIndex,
        onTap: selectedpage,
        items:const  [
        BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
      ]),
    );

  }
}