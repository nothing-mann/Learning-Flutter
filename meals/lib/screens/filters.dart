import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

// enum Filters { gluttenFree, lactoseFree, vegeterian, vegan }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
    //required this.currentFilters,
  });

//   //final Map<Filters, bool> currentFilters;
//   @override
//   ConsumerState<FiltersScreen> createState() {
//     return _FiltersScreenState();
//   }
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _gluttenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegeterianFilterSet = false;
//   var _veganFilterSet = false;

//   @override
//   void initState() {
//     super.initState();
//     final activeFilters = ref.read(filtersProvider);
//     _gluttenFreeFilterSet = activeFilters[Filters.gluttenFree]!;
//     _lactoseFreeFilterSet = activeFilters[Filters.lactoseFree]!;
//     _vegeterianFilterSet = activeFilters[Filters.vegeterian]!;
//     _veganFilterSet = activeFilters[Filters.vegan]!;
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body:
          // WillPopScope(
          //   onWillPop: () async {
          //     ref.read(filtersProvider.notifier).setFilters({
          //       Filters.gluttenFree: _gluttenFreeFilterSet,
          //       Filters.lactoseFree: _lactoseFreeFilterSet,
          //       Filters.vegeterian: _vegeterianFilterSet,
          //       Filters.vegan: _veganFilterSet
          //     });
          //     //Navigator.of(context).pop({});
          //     return true;
          //   },
          //child:
          Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filters.gluttenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.gluttenFree, isChecked);
              // setState(() {
              //   _gluttenFreeFilterSet = isChecked;
              // });
            },
            title: Text(
              'Glutten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only glutten-free food is included here.',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 32,
              right: 22,
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filters.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.lactoseFree, isChecked);
              // setState(() {
              //   _lactoseFreeFilterSet = isChecked;
              // });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only lactose-free food is included here.',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 32,
              right: 22,
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegeterian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegeterian, isChecked);
              // setState(() {
              //   _vegeterianFilterSet = isChecked;
              // });
            },
            title: Text(
              'Vegeterian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only vegeterian food is included here.',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 32,
              right: 22,
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegan, isChecked);
              // setState(() {
              //   _veganFilterSet = isChecked;
              // });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only vegan food is included here.',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 32,
              right: 22,
            ),
          ),
        ],
      ),
    );
  }
}
