import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screen/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final void Function(Meal meal) addFavMeal;
  final List<Meal> availableMeals;

  const CategoryItem(
      {super.key,
      required this.category,
      required this.addFavMeal,
      required this.availableMeals});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //meals ky data me jaengy or har ik meal me dekhengy ky hmari category ki id usme hai k nh hai
          // or wo sari meals return krwadengy
          var categoryMeals = availableMeals.where((meal) {
            return meal.categories.contains(category.id);
          }).toList();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MealsScreen(
                addFavMeal: addFavMeal,
                mealsData: categoryMeals,
                title: "${category.title} Meals");
          }));
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [
                category.color.withOpacity(.9),
                category.color.withOpacity(.2),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Text(category.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)),
        ));
  }
}
