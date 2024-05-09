import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget{
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilter = ref.watch(filterProvier);
    return Scaffold(
        appBar: AppBar(title: const Text("Your Filters")),
        body: Column(
            children: [
              SwitchListTile(
                value: activeFilter[Filter.glutenFree]!,
                onChanged: (isChecked) {
                  ref.read(filterProvier.notifier).setFilter(Filter.glutenFree, isChecked);
                },
                title: Text(
                  'Glueten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only include Glueten-free meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              SwitchListTile(
                value: activeFilter[Filter.lactoseFree]!,
                onChanged: (isChecked) {
                  ref.read(filterProvier.notifier).setFilter(Filter.lactoseFree, isChecked);
                },
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only include lactose-free meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              SwitchListTile(
                value: activeFilter[Filter.vegetarian]!,
                onChanged: (isChecked) {
                  ref.read(filterProvier.notifier).setFilter(Filter.vegetarian, isChecked);
                },
                title: Text(
                  'Vagetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only include vagetarian meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              SwitchListTile(
                value: activeFilter[Filter.vegan]!,
                onChanged: (isChecked) {
                  ref.read(filterProvier.notifier).setFilter(Filter.vegan, isChecked);
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  'Only include Vegan meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ],
          ),
        );
  }
}
