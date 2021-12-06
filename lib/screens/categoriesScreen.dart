import 'package:flutter/material.dart';
import 'package:meals_app/allLists.dart';
import 'package:meals_app/widgets/categoryWidget.dart';

class CategoriesScreen extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: MediaQuery.of(context).size.width*0.2,
            mainAxisExtent: MediaQuery.of(context).size.height*0.35,
        ),
        children: categoriesList
            .map((e) => CategoryWidget(e.title!, e.color!,e.id!))
            .toList(),
      ),
    );
  }
}
