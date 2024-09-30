import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) changeScreen;

  const MainDrawer({super.key, required this.changeScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.amber.shade300, Colors.amber.shade800],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(
                  Icons.food_bank,
                  color: Colors.black,
                  size: 50,
                ),
                SizedBox(width: 20),
                Text(
                  "What's Cooking?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text("Meals", style: TextStyle(fontSize: 20)),
            onTap: () {
              changeScreen("meals");
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text("Filter", style: TextStyle(fontSize: 20)),
            onTap: () {
              changeScreen("filter");
            },
          )
        ],
      ),
    );
  }
}
