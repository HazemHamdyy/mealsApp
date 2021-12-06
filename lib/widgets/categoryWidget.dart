import 'package:flutter/material.dart';
import 'package:meals_app/models/categoryModel.dart';
import 'package:meals_app/screens/mealsOfCategoryScreen.dart';

class CategoryWidget extends StatelessWidget {
  final String? id;
  final String? title;
  final Color? color;

  const CategoryWidget(this.title, this.color, this.id);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(MealsOfCategoryScreen.routeName,
        arguments: {'id': id!, 'title': title! , 'color' : color!});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Colors.red,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Center(child: Text(title!)),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
              colors: [color!.withOpacity(0.3),color!.withOpacity(0.5), color!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
