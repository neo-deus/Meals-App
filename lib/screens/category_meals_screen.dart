import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  //static const can be used to prevent typos in route names
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedItems;
  var _loadedInit = false;

  @override
  void initState() {
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // final categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];
    // final displayedItems = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();
    //in this case initState won't work because anything that uses .of(context) is not allowed in initState
    super.initState();
    //initState automatically runs before the build method runs for the first time
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInit) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];
      displayedItems = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInit = true;
    }
    super.didChangeDependencies();
    //didChangeDependencies also automatically runs before the build method runs for the first time
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedItems.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // final categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];
    // final categoryMeals = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();
    //all of these were moved to initState because they will be initialised only once
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedItems[index].id,
              title: displayedItems[index].title,
              imageUrl: displayedItems[index].imageUrl,
              duration: displayedItems[index].duration,
              complexity: displayedItems[index].complexity,
              affordability: displayedItems[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedItems.length,
        ));
  }
}
