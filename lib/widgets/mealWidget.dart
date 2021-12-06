import 'package:flutter/material.dart';
import 'package:meals_app/allLists.dart';
import 'package:meals_app/models/mealModel.dart';
import 'package:meals_app/screens/mealDetailScreen.dart';

class MealWidget extends StatefulWidget {
  final String? id;
  final String? title;
  final String? image;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  final Healthy? healthy;
  bool? isFav;

   MealWidget(
      {@required this.id,
      @required this.title,
      @required this.image,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.healthy,
      @required this.isFav
      });

  @override
  _MealWidgetState createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {
  String get complexityText {
    switch (widget.complexity) {
      case Complexity.simple:
        return 'Simple';
        break;
      case Complexity.challenging:
        return 'Challenging';
        break;
      case Complexity.hard:
        return 'Hard';
        break;
      default:
        return '';
    }
  }

  String get affordabilityText {
    switch (widget.affordability) {
      case Affordability.lowCost:
        return 'Low Cost';
        break;
      case Affordability.meduimCost:
        return 'Meduim Cost';
        break;
      case Affordability.highCost:
        return 'High Cost';
        break;
      default:
        return '';
    }
  }

  String get healthyText {
    switch (widget.healthy) {
      case Healthy.unHealthy:
        return 'Unhealthy';
        break;
      case Healthy.healthy:
        return 'A Little bit Healthy';
        break;
      case Healthy.veryHealthy:
        return 'very Healthy';
        break;
      default:
        return '';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,arguments: widget.id );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    widget.image!,
                    // height: 250,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black54,
                    child: Text(
                      widget.title!,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Positioned(
                  top: 7,
                  left: 7,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        widget.isFav = !widget.isFav!;
                     final favMeal = mealsList.firstWhere((element) => element.id==widget.id);
                     favMeal.isFav = !favMeal.isFav!;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: widget.isFav==false? Icon(Icons.favorite_border) :Icon(Icons.favorite,color: Colors.red,)),
                  )
                    
                    )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        height: 6,
                      ),
                      Text('${widget.duration} minutes'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        height: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        height: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.health_and_safety),
                      SizedBox(
                        height: 6,
                      ),
                      Text(healthyText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
