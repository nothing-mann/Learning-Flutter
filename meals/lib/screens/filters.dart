import 'package:flutter/material.dart';

enum Filters { gluttenFree, lactoseFree, vegeterian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filters, bool> currentFilters;
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gluttenFreeFilterSet = widget.currentFilters[Filters.gluttenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filters.lactoseFree]!;
    _vegeterianFilterSet = widget.currentFilters[Filters.vegeterian]!;
    _veganFilterSet = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.gluttenFree: _gluttenFreeFilterSet,
            Filters.lactoseFree: _lactoseFreeFilterSet,
            Filters.vegeterian: _vegeterianFilterSet,
            Filters.vegan: _veganFilterSet
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _gluttenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Glutten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only glutten-free food is included here.',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 32,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only lactose-free food is included here.',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 32,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _vegeterianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegeterianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegeterian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only vegeterian food is included here.',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 32,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only vegan food is included here.',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 32,
                right: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
