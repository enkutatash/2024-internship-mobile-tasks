part of 'search_bloc.dart';

enum SearchStatus { initial, loading, loaded, failure }

// ignore: must_be_immutable
class SearchState extends Equatable {
  final SearchStatus status;
  List<ProductEntity>? products;
  List<ProductEntity> filteredProducts;
  final int? minPrice;
  final int? maxPrice;
  final String? search;

  SearchState({
    this.status = SearchStatus.initial,
    this.products = const [],
    this.filteredProducts = const [],
    this.minPrice = 0,
    this.maxPrice = 100000,
    this.search='',

  });

  SearchState copyWith(
      {SearchStatus? status,
      List<ProductEntity>? products,
      List<ProductEntity>? filteredProducts,
       int? minPrice,
       int? maxPrice,
        String? search,
      }) {
    return SearchState(
      status: status ?? this.status,
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      search: search ?? this.search,
    );
  }

  @override
  List<Object?> get props => [status, products,filteredProducts,minPrice,maxPrice,search];
}
