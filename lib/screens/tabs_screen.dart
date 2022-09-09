import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('DeliMeals'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              CategoriesScreen(),
              FavoritesScreen(),
            ],
          ),
        ));
  }
}
