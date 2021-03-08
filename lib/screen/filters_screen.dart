import 'package:flutter/material.dart';
import 'package:flutter_cookbook/components/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  Function saveFilters;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildListStyle(
      String title, String desc, bool currentVal, Function updateVal) {
    return SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(desc),
      onChanged: (bool newVal) {
        setState(() => updateVal(newVal));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.saveFilters(
              {
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
              },
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildListStyle(
                  'Gluten Free', 'Only include gluten-free meals', _glutenFree,
                  (newVal) {
                _glutenFree = newVal;
              }),
              _buildListStyle(
                  'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                  (newVal) {
                _vegetarian = newVal;
              }),
              _buildListStyle('Vegan', 'Only include vegan meals', _vegan,
                  (newVal) {
                _vegan = newVal;
              }),
              _buildListStyle('Lactose Free', 'Only include lactose-free meals',
                  _lactoseFree, (newVal) {
                _lactoseFree = newVal;
              }),
            ],
          ))
        ],
      ),
    );
  }
}
