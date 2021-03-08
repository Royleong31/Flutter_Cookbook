import 'package:flutter/material.dart';
import 'package:flutter_cookbook/components/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
