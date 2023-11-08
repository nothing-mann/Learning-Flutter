import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/data/dummy_items.dart';
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
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  @override
  void initState() {
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'grocerylist-6a115-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);

    if (response.body == 'null') {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final Map<String, dynamic> listData = jsonDecode(response.body);
    final List<GroceryItem> _loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere((catItem) => catItem.value.name == item.value['category'])
          .value;
      _loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }
    setState(() {
      _groceryItems = _loadedItems;
      _isLoading = false;
    });
  }

  void addItems() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItems()));
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });

    _loadItems();
  }

  void _removeItem(GroceryItem item) {
    final url = Uri.https('grocerylist-6a115-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');
    http.delete(url);
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
          ? (_isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Center(
                  child: Text('Nothing in the list. You are free to go home.'),
                ))
          : GroceryList(
              groceryList: _groceryItems,
              removeItem: _removeItem,
            ),
    );
  }
}
