import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_items.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

//import 'package:shopping_list/data/dummy_items.dart';

class Groceries extends StatefulWidget {
  const Groceries({super.key});

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  final List<GroceryItem> _groceryItems = [];

  void addItems() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItems()));
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        actions: [
          IconButton(
              onPressed: () {
                addItems();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: _groceryItems.isEmpty
          ? const Center(
              child: Text('Nothing in the list. You are free to go home.'),
            )
          : GroceryList(
              groceryList: _groceryItems,
              removeItem: _removeItem,
            ),
    );
  }
}
