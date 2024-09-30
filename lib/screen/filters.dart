import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  Map<String, bool> savedFilters;

  Filters({super.key, required this.savedFilters});

  @override
  State<Filters> createState() {
    return _FiltersState();
  }
}

class _FiltersState extends State<Filters> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isGlutenFree = widget.savedFilters["isGlutenFree"]!;
    isLactoseFree = widget.savedFilters["isLactoseFree"]!;
    isVegan = widget.savedFilters["isVegan"]!;
    isVegetarian = widget.savedFilters["isVegetarian"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Filters")),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            if (didPop) return;
            Navigator.of(context).pop({
              "isGlutenFree": isGlutenFree,
              "isLactoseFree": isLactoseFree,
              "isVegan": isVegan,
              "isVegetarian": isVegetarian
            });
          },
          child: Column(
            children: [
              SwitchListTile(
                value: isGlutenFree,
                onChanged: (bool ischecked) {
                  setState(() {
                    isGlutenFree = ischecked;
                  });
                },
                title: const Text(
                  "Gluten Free",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                subtitle: const Text(
                  "Meals are gluten free",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                activeColor: Colors.orange,
                contentPadding: const EdgeInsets.only(left: 18, bottom: 20),
              ),
              SwitchListTile(
                value: isLactoseFree,
                onChanged: (bool ischecked) {
                  setState(() {
                    isLactoseFree = ischecked;
                  });
                },
                title: const Text(
                  "Lactose Free",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                subtitle: const Text(
                  "Meals are lactose free",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                activeColor: Colors.orange,
                contentPadding: const EdgeInsets.only(left: 18, bottom: 20),
              ),
              SwitchListTile(
                value: isVegan,
                onChanged: (bool ischecked) {
                  setState(() {
                    isVegan = ischecked;
                  });
                },
                title: const Text(
                  "Vegan",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                subtitle: const Text(
                  "Meals are Vegan",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                activeColor: Colors.orange,
                contentPadding: const EdgeInsets.only(left: 18, bottom: 20),
              ),
              SwitchListTile(
                value: isVegetarian,
                onChanged: (bool ischecked) {
                  setState(() {
                    isVegetarian = ischecked;
                  });
                },
                title: const Text(
                  "Vegetarian",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                subtitle: const Text(
                  "Meals are vegetarian",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                activeColor: Colors.orange,
                contentPadding: const EdgeInsets.only(left: 18, bottom: 20),
              ),
            ],
          ),
        ));
  }
}
