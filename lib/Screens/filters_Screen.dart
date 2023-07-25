import 'package:flutter/material.dart';
import 'package:meal/Screens/tabs.dart';
import 'package:meal/Widgets/main_drawer.dart';

enum Filters {
  Glutenfree,
  Lactosefree,
  Vegetarian,
  Vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilter});
  final Map<Filters, bool> currentFilter;
  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFreefilter = false;
  var lactoseFreefilter = false;
  var vegetarianfilter = false;
  var veganfilter = false;

  @override
  void initState() {
    super.initState();
    glutenFreefilter = widget.currentFilter[Filters.Glutenfree]!;
    lactoseFreefilter = widget.currentFilter[Filters.Lactosefree]!;
    vegetarianfilter = widget.currentFilter[Filters.Vegetarian]!;
    veganfilter = widget.currentFilter[Filters.Vegan]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
      // drawer: MainDrawer(selectedFilters: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: WillPopScope(
        onWillPop:() async {
           Navigator.of(context).pop({
          Filters.Glutenfree: glutenFreefilter,
          Filters.Lactosefree: lactoseFreefilter,
          Filters.Vegetarian: vegetarianfilter,
          Filters.Vegan: veganfilter,
        });
        return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreefilter,
              onChanged: (isChecked) {
                setState(() {
                  glutenFreefilter = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Include Gluten-free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
                      SwitchListTile(
              value: lactoseFreefilter,
              onChanged: (isChecked) {
                setState(() {
                  lactoseFreefilter = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Include lactose-free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
                      SwitchListTile(
              value: vegetarianfilter,
              onChanged: (isChecked) {
                setState(() {
                  vegetarianfilter = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Include Vegetarian Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
                      SwitchListTile(
              value: veganfilter,
              onChanged: (isChecked) {
                setState(() {
                  veganfilter = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Include Vegan Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
