import 'dart:async';

import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_all_product_usecase.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_event.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  
  HomePageBloc(
      {required GetAllProductUsecase getAllProductUsecase,})
      : _getAllProductUsecase = getAllProductUsecase,
        super(const HomePageState()) {
    on<FetchAllProducts>(fetchProduct);
  }

  final GetAllProductUsecase _getAllProductUsecase;

  Future<void> fetchProduct(
      FetchAllProducts event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomePageStatus.loading));

    try {
      final either = await _getAllProductUsecase.execute();
      either.fold(
        (failure) {
          emit(state.copyWith(
            status: HomePageStatus.failure,
            productEntity: [],
          ));
        },
        (products) {
          emit(state.copyWith(
            status: HomePageStatus.success,
            productEntity: products,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: HomePageStatus.failure,
      ));
    }
  }
}
