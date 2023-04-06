import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

import './screens/tabs_screen.dart';
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
      home: TabsScreen(),
      initialRoute:
          '/', // if u want to start the app at a diff page, this is the way(default is '/')
      routes: {
        //'/': (ctx) => TabsScreen(), //this is another way of declaring the homepage
        //if home: is used then this route can't be used
        '/category-meals': (ctx) => CategoryMealsScreen(),
        //CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),  //use this if u r using static const
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   if(settings.name == '/meal-details'){
      //     return someMaterialPageRoute();}
      //   else if(settings.name =='/something-else'){
      //     return someotherMaterialPageRoute();}
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      //when a route is not registered in routes section then onGenerateRoute is called
      //onGenerateRoute also gives you access to the settings
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      //when a route is not mentioned anywhere then the last resort is onUnknownRoute
      //this is equivalent to the 404 error page in web page
    );
  }
}
