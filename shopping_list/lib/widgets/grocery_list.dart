import 'package:flutter/material.dart';
//import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList(
      {super.key, required this.groceryList, required this.removeItem});
  final List<GroceryItem> groceryList;
  final void Function(GroceryItem item) removeItem;

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: widget.groceryList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(widget.groceryList[index].id),
          onDismissed: (direction) {
            widget.removeItem(widget.groceryList[index]);
          },
          child: ListTile(
            leading: Container(
              width: 24,
              height: 24,
              color: widget.groceryList[index].category.color,
            ),
            title: Text(widget.groceryList[index].name),
            trailing: Text(
              widget.groceryList[index].quantity.toString(),
            ),
          ),
        );
      },
    );
  }
}
