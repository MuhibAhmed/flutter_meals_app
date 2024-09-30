import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

class MealsDetailScreen extends StatelessWidget {
  final Meal mealDetail;
  final void Function(Meal meal) addFavMeal;

  const MealsDetailScreen({
    super.key,
    required this.mealDetail,
    required this.addFavMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetail.title),
        actions: [
          IconButton(
            onPressed: () {
              print("CALLED");
              addFavMeal(mealDetail);
            },
            icon: const Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Meal Image
            Image.network(
              mealDetail.imageUrl,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),

            // Meal Description Heading
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Description',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'A delicious meal perfect for a quick dinner.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),

            // Meal Price Heading
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Price',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$12.99',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),

            // Ingredients Heading
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: mealDetail.ingredients
                    .map((ingredient) => Text(
                          '- $ingredient',
                          style: const TextStyle(color: Colors.white),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),

            // Steps Heading
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: mealDetail.steps
                    .map((step) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '${mealDetail.steps.indexOf(step) + 1}. $step',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
