import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text('The meal-$mealId'),
      ),
    );
  }
}
