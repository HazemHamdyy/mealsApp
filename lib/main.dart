import 'package:flutter/material.dart';
import 'package:meals_app/allLists.dart';
import 'package:meals_app/models/mealModel.dart';
import 'package:meals_app/screens/bottomNavBarScreen.dart';
import 'package:meals_app/screens/categoriesScreen.dart';
import 'package:meals_app/screens/filtersScreen.dart';
import 'package:meals_app/screens/mealDetailScreen.dart';
import 'package:meals_app/screens/mealsOfCategoryScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'gluten-Free' :false,
    'lactose-free' : false,
    'vegetrian' : false
  };
  List<MealModel> _availableMeals = mealsList;

  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = mealsList.where((element) {
        if(_filters['gluten-Free']! && !element.isGlutenFree!){
          return false;
        }
        if(_filters['lactose-free']! && !element.isLactoseFree!){
          return false;
        }
        if(_filters['vegetrian']! && !element.isVegetarian!){
          return false;
        }

        return true;
      }).toList();

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'meals app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:BottomNavBarScreen(),
      routes: {
        '/' : (context) => BottomNavBarScreen(),
        MealsOfCategoryScreen.routeName : (context) => MealsOfCategoryScreen(_availableMeals),
        MealDetailScreen.routeName : (context) => MealDetailScreen(),
         FiltersScreen.routeName : (context) => FiltersScreen(_filters,_setFilters),
      },
    );
  }
}


