import 'package:flutter/material.dart';
import 'package:flutter_cookbook/components/main_drawer.dart';
import 'package:flutter_cookbook/screen/categories_screen.dart';
import './favourites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(widget.favouriteMeals), 'title': 'Favourites'}
    ];
    super.initState();
  }

  void _selectPage(ind) {
    setState(() {
      _selectedPageIndex = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 15,
        // type: BottomNavigationBarType.shifting,
      ),
    );
  }
}

// Top tab bar
// class F extends StatelessWidget {
//   const F({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       // initialIndex: 1,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             tabs: [
//               Tab(icon: Icon(Icons.category), text: 'Categories'),
//               Tab(icon: Icon(Icons.star), text: 'Favourites')
//             ],
//           ),
//         ),
//         body: TabBarView(children: [CategoriesScreen(), FavouritesScreen()],)
//       ),
//     );
//   }
// }
