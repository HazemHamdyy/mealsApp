import 'package:flutter/material.dart';
import 'package:meals_app/allLists.dart';
import 'package:meals_app/models/mealModel.dart';
import 'package:meals_app/widgets/mealWidget.dart';

class MealsOfCategoryScreen extends StatefulWidget {
  static const routeName = '/mealsOfCategoryScreen';

  final List<MealModel> availableMeals ;
  MealsOfCategoryScreen(this.availableMeals);

  @override
  _MealsOfCategoryScreenState createState() => _MealsOfCategoryScreenState();
}

class _MealsOfCategoryScreenState extends State<MealsOfCategoryScreen> {
  



  
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String categoryTitle = routeArgs['title'];
    final String categoryID = routeArgs['id'];
    final Color categoryColor = routeArgs['color'];
    final List categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories!.contains(categoryID);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(categoryTitle),
          backgroundColor: categoryColor,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealWidget(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              image: categoryMeals[index].image,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              healthy: categoryMeals[index].healthy,
              isFav: categoryMeals[index].isFav,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
