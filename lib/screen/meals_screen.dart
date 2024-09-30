import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meals_widget.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> mealsData;
  final String? title;
  final void Function(Meal meal) addFavMeal;

  const MealsScreen({
    super.key,
    required this.mealsData,
    this.title,
    required this.addFavMeal,
  });

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return MealsWidget(
        mealsData: mealsData,
        addFavMeal: addFavMeal,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: MealsWidget(
        mealsData: mealsData,
        addFavMeal: addFavMeal,
      ),
    );
  }
}
