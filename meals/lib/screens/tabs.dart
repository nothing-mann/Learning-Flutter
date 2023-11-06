import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';

const kInitialFilters = {
  Filters.gluttenFree: false,
  Filters.lactoseFree: false,
  Filters.vegeterian: false,
  Filters.vegan: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  Map<Filters, bool> selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleFavouriteStatus(Meal meal) {
    final isPresent = _favouriteMeals.contains(meal);
    if (isPresent) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showInfoMessage('Removed from favourites');
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        _showInfoMessage('Added to favourites');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectScreen(String identifier) async {
    if (identifier == 'filter') {
      final result = await Navigator.of(context)
          .push<Map<Filters, bool>>(MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                    currentFilters: selectedFilters,
                  )));
      setState(() {
        selectedFilters = result ?? kInitialFilters; // ?? fallback operation
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(context) {
    final availableMeals = dummyMeals.where((meal) {
      if (selectedFilters[Filters.gluttenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filters.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      onToggleFavourite: _toggleFavouriteStatus,
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleFavouriteStatus,
      );
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(
        onSelectScreen: _selectScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites'),
        ],
      ),
    );
  }
}
