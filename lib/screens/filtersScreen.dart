import 'package:flutter/material.dart';
import 'package:meals_app/widgets/mainDrawerWidget.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtersScreen';

  final Function saveFilter;
  final Map<String,bool> currentFilter;
  FiltersScreen(this.currentFilter,this.saveFilter);

 

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegerian = false;

  @override
  void initState() {
    isGlutenFree = widget.currentFilter['gluten-Free']!;
    isLactoseFree = widget.currentFilter['lactose-free']!;
    isVegerian = widget.currentFilter['vegetrian']!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter Types'),
          backgroundColor: Colors.red,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilter = {
                    'gluten-Free': isGlutenFree,
                    'lactose-free': isLactoseFree,
                    'vegetrian': isVegerian
                  };
                  widget.saveFilter(selectedFilter);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawerWidget(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust Your Meal Selection'),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                    title: Text('Gluten-Free'),
                    subtitle: Text('Only Include Gluten-Free Meals'),
                    value: isGlutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        isGlutenFree = newValue;
                      });
                      isGlutenFree = newValue;
                    }),
                SwitchListTile(
                    title: Text('Lactose-Free'),
                    subtitle: Text('Only Include Lactose-Free Meals'),
                    value: isLactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        isLactoseFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Vegetrian'),
                    subtitle: Text('Only Include Vegetrian Meals'),
                    value: isVegerian,
                    onChanged: (newValue) {
                      setState(() {
                        isVegerian = newValue;
                      });
                    }),
              ],
            ))
          ],
        ));
  }
}
