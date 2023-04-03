import 'package:flutter/material.dart';
import 'screens/meal_detail_screen.dart';

import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          //colorScheme is newer version of accentColor
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: CategoriesScreen(),
      //initialRoute: '/',      if u want to start the app at a diff page, this is the way
      routes: {
        //'/': (ctx) => CategoriesScreen(), this is another way of declaring the homepage
        '/category-meals': (ctx) => CategoryMealsScreen(),
        //CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),  //use this if u r using static const
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}
