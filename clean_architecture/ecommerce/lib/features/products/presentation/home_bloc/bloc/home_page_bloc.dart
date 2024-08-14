import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/delete_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_all_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/update_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  GetAllProductUsecase getAllProductUsecase;
  DeleteProductUsecase deleteProductUsecase;
  AddProductUsecase addProductUsecase;
  UpdateProductUsecase updateProductUsecase;
  HomePageBloc({
    required this.updateProductUsecase,
    required this.addProductUsecase,
    required this.deleteProductUsecase,
    required this.getAllProductUsecase,
  }) : super(const HomePageState(status: HomePageStatus.initial)) {
    on<HomePageEvent>(_fetchAllProduct);
    on<DeleteProduct>(_deleteProduct);
    on<AddProductPress>(_addProduct);
    on<UpdateProductPress>(_updateProduct);
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

  Future<void> _addProduct(
      AddProductPress event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomePageStatus.loading));
    var product = ProductEntity(
        description: event.description,
        name: event.name,
        price: event.price.toInt(),
        imageUrl: event.imageUrl);

    try {
      await addProductUsecase.execute(product);
      emit(state.copyWith(status: HomePageStatus.loaded));
      add(FetchAllProducts());
    } catch (e) {
      emit(state.copyWith(status: HomePageStatus.failure));
    }
  }

  Future<void> _updateProduct(UpdateProductPress event, Emitter<HomePageState> emit) async{
    emit(state.copyWith(status: HomePageStatus.loading));
    var product = ProductEntity(
        id: event.id,
        description: event.description,
        name: event.name,
        price: event.price.toInt(),
        imageUrl: event.imageUrl);

    try {
    await updateProductUsecase.execute(product);
      emit(state.copyWith(status: HomePageStatus.loaded));
      add(FetchAllProducts());
    } catch (e) {
      emit(state.copyWith(status: HomePageStatus.failure));
    }

  }
}
