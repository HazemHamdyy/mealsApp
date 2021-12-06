import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

enum Complexity { simple, challenging, hard }
enum Affordability { lowCost, meduimCost, highCost }
enum Healthy { unHealthy, healthy, veryHealthy }

class MealModel {
  final String? id;
  final List<String>? categories;
  final String? title;
  final String? image;
  final List<String>? extraImage;
  final List<String>? ingredients;
  final List<String>? steps;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  final Healthy? healthy;
  final bool? isGlutenFree;
  final bool? isLactoseFree;
  final bool? isVegetarian;
  bool? isFav;

   MealModel(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.image,
      @required this.extraImage,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.healthy,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegetarian,
      @required this.isFav});


 
}
