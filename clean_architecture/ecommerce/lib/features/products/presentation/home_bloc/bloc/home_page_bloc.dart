import 'dart:async';

import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/delete_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_all_product_usecase.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_event.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  DeleteProductUsecase deleteProductUsecase;
  AddProductUsecase addProductUsecase;
  GetAllProductUsecase getAllProductUsecase;
  HomePageBloc({
    required this.addProductUsecase,
    required this.deleteProductUsecase,
    required this.getAllProductUsecase,
  }) : super(const HomePageState()) {
    on<FetchAllProducts>(fetchProduct);
    on<DeleteProduct>(_deleteProduct);
    on<OnNamedChanged>(_nameChange);
    on<OnDescriptionChanged>(_descriptionChange);
    on<OnImageChanged>(_imageChange);
    on<OnPriceChanged>(_priceChange);
    on<AddProductEvent>(_submit);
  }

  Future<void> fetchProduct(
      FetchAllProducts event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomePageStatus.loading));

    try {
      // Listen to the stream of products
      await for (final products in getAllProductUsecase.execute()) {
        // If the stream is updated with a new list of products, update the state
        emit(state.copyWith(
          status: HomePageStatus.success,
          productEntity: products,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: HomePageStatus.failure,
        productEntity: [],
      ));
    }
  }

  FutureOr<void> _deleteProduct(
      DeleteProduct event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomePageStatus.loading));
    try {
      await deleteProductUsecase.execute(event.id);
      add(FetchAllProducts());
    } catch (e) {
      emit(state.copyWith(status: HomePageStatus.failure));
    }
  }

  FutureOr<void> _nameChange(
      OnNamedChanged event, Emitter<HomePageState> emit) {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _descriptionChange(
      OnDescriptionChanged event, Emitter<HomePageState> emit) {
    emit(state.copyWith(description: event.description));
  }

  FutureOr<void> _imageChange(
      OnImageChanged event, Emitter<HomePageState> emit) {
    print("Event imageUrl: ${event.imageUrl}");
    emit(state.copyWith(imageUrl: event.imageUrl));

    print("State before update: ${state.imageUrl}");
  }

  FutureOr<void> _priceChange(
      OnPriceChanged event, Emitter<HomePageState> emit) {
    emit(state.copyWith(price: event.price));
  }

  FutureOr<void> _submit(
      AddProductEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomePageStatus.loading));
    final product = ProductEntity(
      name: state.name!,
      description: state.description!,
      imageUrl: state.imageUrl!,
      price: (state.price)!.toInt(),
    );
    try {
      print("image: ${state.imageUrl}");
      final either = await addProductUsecase.execute(product);

      either.fold((failure) {
        print("failed bloc $failure");
        emit(state.copyWith(status: HomePageStatus.failure));
      }, (success) {
        print("success bloc");
        add(FetchAllProducts());
        emit(state.copyWith(
          status: HomePageStatus.success,
          imageUrl:
              "https://st4.depositphotos.com/14953852/24787/v/380/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg",
          name: "",
          description: "",
          price: 0.0,
        ));
      });
    } catch (e) {
      print("error bloc $e");
      emit(state.copyWith(status: HomePageStatus.failure));
    }
  }
}
