import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screen/meals_detail_screen.dart';
import 'meals_trait.dart'; // Import the MealTrait widget

class MealsWidget extends StatelessWidget {
  final List<Meal> mealsData;
  final void Function(Meal meal) addFavMeal;

  const MealsWidget({
    super.key,
    required this.mealsData,
    required this.addFavMeal,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh..yahan kch nh hai nikal',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 14),
          Text(
            'Dsri category pe jaa ',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );

    if (mealsData.isNotEmpty) {
      content = ListView.builder(
        itemCount: mealsData.length,
        itemBuilder: (context, index) {
          final meal = mealsData[index];
          return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MealsDetailScreen(
                    addFavMeal: addFavMeal,
                    mealDetail: meal,
                  );
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Stack(
                    children: [
                      // Background image
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(meal.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // Meal information with opacity
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                meal.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  MealTrait(
                                    icon: Icons.schedule,
                                    text: '${meal.duration} min',
                                  ),
                                  MealTrait(
                                    icon: Icons.work,
                                    text: meal.complexity_up,
                                  ),
                                  MealTrait(
                                    icon: Icons.attach_money,
                                    text: meal.affordability_up,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      );
    }

    return content;
  }
}
