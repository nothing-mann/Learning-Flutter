import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favourites_provider.dart';

//import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
// import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';

const kInitialFilters = {
  Filters.gluttenFree: false,
  Filters.lactoseFree: false,
  Filters.vegeterian: false,
  Filters.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> _favouriteMeals = [];

  //Map<Filters, bool> selectedFilters = kInitialFilters;

  // void _showInfoMessage(String message) {}

  // void _toggleFavouriteStatus(Meal meal) {
  //   final isPresent = _favouriteMeals.contains(meal);
  //   if (isPresent) {
  //     setState(() {
  //       _favouriteMeals.remove(meal);
  //     });
  //     _showInfoMessage('Removed from favourites');
  //   } else {
  //     setState(() {
  //       _favouriteMeals.add(meal);
  //       _showInfoMessage('Added to favourites');
  //     });
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectScreen(String identifier) async {
    if (identifier == 'filter') {
      await Navigator.of(context).push<Map<Filters, bool>>(MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(
              //currentFilters: selectedFilters,
              )));
      // setState(() {
      //   selectedFilters = result ?? kInitialFilters; // ?? fallback operation
      // });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(context) {
    // final meals = ref.watch(mealsProvider);
    // final activeFilters = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
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
