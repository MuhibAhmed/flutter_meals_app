import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/filters.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int selectedScreen = 0;
  final List<Meal> favMeal = [];
  String screenTitle = "Categories";
  List<Meal> availableMeals = mealsData;
  Map<String, bool> defaultFilters = {
    "isGlutenFree": false,
    "isLactoseFree": false,
    "isVegan": false,
    "isVegetarian": false
  };

  void showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void toggleFavMeal(Meal meal) {
    setState(() {
      if (favMeal.contains(meal)) {
        favMeal.remove(meal);
        showMessage("Meal removed from favorites");
      } else {
        favMeal.add(meal);
        showMessage("Meal added to favorites");
      }
    });
  }

  void changeScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == "filter") {
      final filtersMap = await Navigator.of(context).push<Map<String, bool>>(
          MaterialPageRoute(builder: (BuildContext context) {
        return Filters(
          savedFilters: defaultFilters,
        );
      }));

      defaultFilters["isGlutenFree"] = filtersMap!["isGlutenFree"]!;
      defaultFilters["isLactoseFree"] = filtersMap["isLactoseFree"]!;
      defaultFilters["isVegan"] = filtersMap["isVegan"]!;
      defaultFilters["isVegetarian"] = filtersMap["isVegetarian"]!;

      List<Meal> filteredMeals = mealsData.where((meal) {
        // Check for each filter individually and only apply if it's not null
        if (filtersMap["isGlutenFree"] != null &&
            meal.isGlutenFree != filtersMap["isGlutenFree"]) {
          return false;
        }
        if (filtersMap["isLactoseFree"] != null &&
            meal.isLactoseFree != filtersMap["isLactoseFree"]) {
          return false;
        }
        if (filtersMap["isVegan"] != null &&
            meal.isVegan != filtersMap["isVegan"]) {
          return false;
        }
        if (filtersMap["isVegetarian"] != null &&
            meal.isVegetarian != filtersMap["isVegetarian"]) {
          return false;
        }
        return true; // Only return true if all applicable conditions are met
      }).toList();

      print(filteredMeals);

      setState(() {
        availableMeals = filteredMeals;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoryScreen(
      addFavMeal: toggleFavMeal,
      availableMeals: availableMeals,
    );

    if (selectedScreen == 1) {
      activeScreen = MealsScreen(
        mealsData: favMeal,
        addFavMeal: toggleFavMeal,
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(screenTitle)),
      body: activeScreen,
      drawer: MainDrawer(changeScreen: changeScreen),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedScreen,
        onTap: (index) {
          setState(() {
            selectedScreen = index;
            screenTitle = "Categories";
            if (index == 1) {
              screenTitle = "Favourite Meals";
            }
          });

          print(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites")
        ],
      ),
    );
  }
}
