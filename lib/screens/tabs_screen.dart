import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

import 'favorite_screen.dart';
import 'categories_screen.dart';
import '../components/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screen;

  @override
  void initState() {
    super.initState();
    _screen = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals)
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: (Text(
          _screen[_selectedScreenIndex]['title'],
        )),
        centerTitle: true,
      ),
      body: _screen[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categoria',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
        unselectedItemColor: Theme.of(context).primaryColorLight,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
