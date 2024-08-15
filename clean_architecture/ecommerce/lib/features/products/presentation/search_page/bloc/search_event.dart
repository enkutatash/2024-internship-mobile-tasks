part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class IntialFetch extends SearchEvent {
  List<ProductEntity> products;
  IntialFetch({required this.products});
}


class SearchTextChange extends SearchEvent {
  final String search;

  SearchTextChange({required this.search});
}


class PriceRange extends SearchEvent {
  final int min;
  final int max;

  PriceRange({required this.min, required this.max});
}


class ApplyFilter extends SearchEvent{}

