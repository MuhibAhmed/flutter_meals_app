import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key, required this.addFavMeal, required this.availableMeals});
  final void Function(Meal meal) addFavMeal;
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    var x = categoryData.map((data) {
      return CategoryItem(
        category: data,
        addFavMeal: addFavMeal,
        availableMeals: availableMeals,
      );
    }).toList();

    return GridView(
        padding: const EdgeInsets.all(14),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: x);
  }
}
