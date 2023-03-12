import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals/models/meal.dart';

class Favouritesscreen extends StatelessWidget {
  final List<Meal> favoritemeals;
  Favouritesscreen(this.favoritemeals);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('You have no favourites yet!'));
  }
}
