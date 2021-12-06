import 'package:flutter/material.dart';
import 'package:meals_app/allLists.dart';
import 'package:meals_app/widgets/mealWidget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({ Key? key }) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  
  @override
  Widget build(BuildContext context) {
   List favMeals =  mealsList.where((element) => element.isFav==true).toList();
    return Scaffold(
      
      body: ListView.builder(
          itemBuilder: (context, index) {
            return MealWidget(
              id: favMeals[index].id,
              title: favMeals[index].title,
              image: favMeals[index].image,
              duration: favMeals[index].duration,
              complexity: favMeals[index].complexity,
              affordability: favMeals[index].affordability,
              healthy: favMeals[index].healthy,
              isFav: favMeals[index].isFav,
            );
          },
          itemCount: favMeals.length,
        )
      
    );
  }
}