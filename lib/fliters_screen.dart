import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals/main_drawer.dart';
import 'dummy_data.dart';

class filterScreen extends StatefulWidget {
  static const String routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  filterScreen(this.currentFilters, this.saveFilters);

  @override
  State<filterScreen> createState() => _filterScreenState();
}

class _filterScreenState extends State<filterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['gluten']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget_buildSwitchListTile(
    String title,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue.call(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final _selectedfilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters();
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDarwer(),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust your meal selection',
                  style: Theme.of(context).textTheme.titleMedium,
                )),
            Expanded(
                child: ListView(
              children: [
                Widget_buildSwitchListTile('Gluten-Free', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                Widget_buildSwitchListTile('Lactose-Free', _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                Widget_buildSwitchListTile('Gluten-Free', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                Widget_buildSwitchListTile('Vegan', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                Widget_buildSwitchListTile('Gluten-Free', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
