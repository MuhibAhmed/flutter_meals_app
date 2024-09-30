import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/tabs.dart';

void main() {
  runApp(const MyApp());
}

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 131, 57, 0),
        brightness: Brightness.dark),
    useMaterial3: true,
    textTheme: GoogleFonts.latoTextTheme());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: theme, home: Tabs());
  }
}
