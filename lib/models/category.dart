import 'package:flutter/material.dart';

const categoryData = [
  Category(id: "c1", title: "Asian", color: Colors.brown),
  Category(id: "c2", title: "American", color: Colors.grey),
  Category(id: "c3", title: "Italian", color: Colors.blueAccent),
  Category(id: "c4", title: "Chinese", color: Colors.indigo),
  Category(id: "c5", title: "Mexican", color: Colors.cyanAccent),
  Category(id: "c6", title: "Indian", color: Colors.lightGreenAccent),
  Category(id: "c7", title: "Thai", color: Colors.pinkAccent),
  Category(id: "c8", title: "Japanese", color: Colors.yellowAccent),
];

class Category {
  final String id;
  final String title;
  final Color color;

  // Getter
  // String get title_or_id {
  //   return title + id;
  // }

  const Category(
      {required this.id, required this.title, this.color = Colors.blue});
}


// var x = Category(id: "2", title: "abc");

// x.title_or_id()

