import 'package:flutter_riverpod/flutter_riverpod.dart';


enum Filters {
  Glutenfree,
  Lactosefree,
  Vegetarian,
  Vegan,
}
class FiltersNotifier extends StateNotifier<Map<Filters, bool>>{
  FiltersNotifier() : super({
    Filters.Glutenfree: false,
    Filters.Lactosefree: false,
    Filters.Vegetarian: false,
    Filters.Vegan: false,
  });

  void setFilters(Map<Filters, bool> choosenFilter){
    state = choosenFilter;
  }

  void setFilter(Filters filter, bool isChecked){
    state = {
      ...state,
      filter: isChecked,
    };
  }
}
final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>((ref) => FiltersNotifier(),);