import 'package:flutter/material.dart';
import 'package:meals_app/screens/filtersScreen.dart';

class MainDrawerWidget extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Colors.redAccent,
            child: Text('Cooking Up!',style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.teal
            ),),
          ),
          SizedBox(height: 20,),
          ListTile(
              leading: Icon(Icons.restaurant,size: 26,),
              title: Text('Meals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('/');
                
              },
              
            ),
          ListTile(
              leading: Icon(Icons.vertical_split_rounded,size: 26,),
              title: Text('Filters',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('/filtersScreen');
              },
            ),
        ],
      ),
    );
  }
}