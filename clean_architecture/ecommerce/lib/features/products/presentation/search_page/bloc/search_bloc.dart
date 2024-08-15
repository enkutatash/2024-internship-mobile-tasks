import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<SearchTextChange>(_searchProduct);
    on<PriceRange>(_priceRange);
    on<IntialFetch>(_intialFetch);
    on<ApplyFilter>(_applyFilter);
  }

  FutureOr<void> _searchProduct(
      SearchTextChange event, Emitter<SearchState> emit) {
    if (event.search.isNotEmpty) {
      final filteredProducts = state.products!
          .where((element) =>
              element.name.toLowerCase().contains(event.search.toLowerCase()))
          .toList();
      emit(state.copyWith(filteredProducts: filteredProducts));
    } else {
      emit(state.copyWith(filteredProducts: state.products));
    }
  }

  FutureOr<void> _priceRange(PriceRange event, Emitter<SearchState> emit) {
    emit(state.copyWith(
      status: SearchStatus.loaded,
      minPrice: event.min,
      maxPrice: event.max,
    ));
  }

  FutureOr<void> _intialFetch(IntialFetch event, Emitter<SearchState> emit) {
    emit(state.copyWith(status: SearchStatus.loading));

    try {
      if (state.filteredProducts.isEmpty) {
        emit(state.copyWith(
            status: SearchStatus.loaded,
            products: event.products,
            filteredProducts: event.products));
      } else {
        emit(state.copyWith(
          status: SearchStatus.loaded,
          products: event.products,
        ));
      }
    } catch (e) {
      print("error $e");
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }

  FutureOr<void> _applyFilter(ApplyFilter event, Emitter<SearchState> emit) {
   
   final priceFilteredProducts = state.products!.where((element) =>
    element.price >= state.minPrice! && element.price <= state.maxPrice!)
    .toList();

  final searchFilteredProducts = state.search!.isNotEmpty
    ? priceFilteredProducts.where((element) =>
      element.name.toLowerCase().contains(state.search!.toLowerCase()))
      .toList()
    : priceFilteredProducts;

  emit(state.copyWith(filteredProducts: searchFilteredProducts, status: SearchStatus.loaded,minPrice: 0,maxPrice: 100000,search: ''));
   
  }
}
