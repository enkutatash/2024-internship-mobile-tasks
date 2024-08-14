import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/delete_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_all_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  GetAllProductUsecase getAllProductUsecase;
  DeleteProductUsecase deleteProductUsecase;
  HomePageBloc({
    required this.deleteProductUsecase,
    required this.getAllProductUsecase,
  }) : super(const HomePageState(status: HomePageStatus.initial)) {
    on<HomePageEvent>(_fetchAllProduct);
    on<DeleteProduct>(_deleteProduct);
  }

  FutureOr<void> _fetchAllProduct(
      HomePageEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomePageStatus.loading));
    try {
      final stream = getAllProductUsecase.execute();
      await for (final result in stream) {
        emit(state.copyWith(status: HomePageStatus.loaded, products: result));
      }
    } catch (e) {
      emit(state.copyWith(status: HomePageStatus.failure));
    }
  }

  FutureOr<void> _deleteProduct(
      DeleteProduct event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomePageStatus.loading));
    try {
      await deleteProductUsecase.execute(event.id);

      emit(state.copyWith(status: HomePageStatus.loaded));
      add(FetchAllProducts());
    } catch (e) {
      emit(state.copyWith(status: HomePageStatus.failure));
    }
  }
}
