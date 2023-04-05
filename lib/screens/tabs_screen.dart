import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Categories',
      'page': CategoriesScreen(),
    },
    {
      'title': 'Your Favorites',
      'page': FavoritesScreen(),
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   //DefaultTabController automatically connected with the TabBar and TabBarView internally by Flutter, and it manages which page to show based on the Tab
    //   length: 2,
    //   //initialIndex: 0,  //default is 0, using this u can fix the page on which the app should first start
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       backgroundColor: Theme.of(context).primaryColor,
    //       bottom: TabBar(
    //         indicatorColor: Theme.of(context).colorScheme.secondary,
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favorites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       //No. of children in TabBarView should be same as no. of Tabs in TabBar
    //       children: [
    //         CategoriesScreen(),
    //         FavoritesScreen(),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        //the biggest difference between DefaultTabController and BottomNavigationBar is that here you have to manually define which page to show and when
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting, //.fixed is the default
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
