import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //DefaultTabController automatically connected with the TabBar and TabBarView internally by Flutter, and it manages which page to show based on the Tab
      length: 2,
      //initialIndex: 0,  //default is 0, using this u can fix the page on which the app should first start
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.secondary,
            tabs: [
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
          //No. of children in TabBarView should be same as no. of Tabs in TabBar
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
