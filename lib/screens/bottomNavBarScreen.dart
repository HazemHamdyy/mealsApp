import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoriesScreen.dart';
import 'package:meals_app/screens/favoriteScreen.dart';
import 'package:meals_app/widgets/mainDrawerWidget.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({ Key? key }) : super(key: key);

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int current = 0;
  List<Widget> screens = [CategoriesScreen(),FavoriteScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: current==0? Text('Categories') : Text('Favorite Meals'),
      ),
      drawer: MainDrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Categories',backgroundColor: Colors.red,),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite',backgroundColor: Colors.red,)
        ],
         type: BottomNavigationBarType.shifting,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current=index;
          }
          );
        },
      ),
      body: screens[current],
      
    );
  }
}