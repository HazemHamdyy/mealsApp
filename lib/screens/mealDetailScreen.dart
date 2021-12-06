import 'package:flutter/material.dart';
import 'package:meals_app/allLists.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealDetailScreen';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        mealsList.firstWhere((element) => element.id == mealID);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(selectedMeal.title!),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.hardLight),
                image: NetworkImage(selectedMeal.image!),
                fit: BoxFit.cover)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Text('Ingerdiants')),
                       Container(
                         height:  MediaQuery.of(context).size.height*0.4,
                         child: ListView.builder(
                      itemCount: selectedMeal.ingredients!.length,
                      itemBuilder: (context, index) {
                          return Container(
                            
                            padding: EdgeInsets.all(4),
                            margin: EdgeInsets.all(4),
                            color: Colors.orange,
                            child: Text('${selectedMeal.ingredients![index]}'));
                      }),
                       ),
                  ],
                
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.05,
                      child: Text('Steps')),
                    Container(
                      height:  MediaQuery.of(context).size.height*0.4,
                      child: ListView.builder(
                        itemCount: selectedMeal.steps!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(4),
                            color: Colors.red,
                            margin: EdgeInsets.all(4),
                            child: Text('                      #Step ${index+1} \n${selectedMeal.steps![index]}'));
                        }),
                    ),
                  ],
                  
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.93,
            child: ListTile(
              title: Text('Extra Images'),
              subtitle:  ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedMeal.extraImage!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                  height: 150,
                  width: 150,
                  child: Image.network(
                    selectedMeal.extraImage![index],
                  ),
                );
              },
            ),
            )
            
          ),
        ]),
      ),
    );
  }
}
