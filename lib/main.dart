import 'package:flutter/material.dart';
import 'package:meals/category_meals_screen.dart';
import 'package:meals/cateogries_screen.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/fliters_screen.dart';
import 'package:meals/meal_detail_screen.dart';
import 'package:meals/models/meal.dart';
import 'tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouritemeals = [];
  void _setFilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFvaourite(String mealId) {
    final existinsIndex =
        _favouritemeals.indexWhere((Meal) => Meal.id == mealId);
    if (existinsIndex >= 0) {
      setState(() {
        _favouritemeals.removeAt(existinsIndex);
      });
    } else {
      setState(() {
        _favouritemeals
            .add(DUMMY_MEALS.firstWhere((Meal) => Meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        // canvasColor: Color.fromRGBO(255, 254, 229, 1),
        // fontFamily: 'Raleway',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //     bodyText1: TextStyle(
        //       color: Color.fromRGBO(20, 51, 51, 1),
        //     ),
        //     bodyText2: TextStyle(
        //       color: Color.fromRGBO(20, 51, 51, 1),
        //     ),
        //     titleMedium: TextStyle(
        //       fontSize: 20,
        //       fontFamily: 'RobotoCondensed',
        //       fontWeight: FontWeight.bold,
        //     )),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => tabScreen(_favouritemeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        filterScreen.routeName: (ctx) => filterScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        //   return MaterialPageRoute(builder: (ctx) => cateogryScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => cateogryScreen(),
        );
      },
    );
  }
}
