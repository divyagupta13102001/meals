import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals/cateogries_screen.dart';
import 'package:meals/fav_screen.dart';
import 'package:meals/main_drawer.dart';
import 'package:meals/models/meal.dart';

class tabScreen extends StatefulWidget {
  final List<Meal> favouritemeals;
  tabScreen(this.favouritemeals);
  @override
  State<tabScreen> createState() => _tabScreenState();
}

class _tabScreenState extends State<tabScreen> {
  late List<Map<String, Object>> pages;

  int selectedPageIndex = 0;
  void selectpage(int Index) {
    setState(() {
      selectedPageIndex = 0;
    });
  }

  @override
  void initState() {
    pages = [
      {'page': cateogryScreen(), 'title': 'Categories'},
      {'page': Favouritesscreen(widget.favouritemeals), 'title': 'Categories'}
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    // // return DefaultTabController(
    // //   length: 2,
    // //   child:
    // Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(icon: Icon(Icons.category), text: 'categories'),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favourites',
    //           )
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: <Widget>[
    //   cateogryScreen(),
    //   Favouritesscreen(),
    // ],
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'].toString()),
      ),
      drawer: MainDarwer(),
      body: pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favourites'),
        ],
      ),
    );
  }
}
