import 'dart:async';

import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/products/presentation/add_product/bloc/add_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_product_event.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductUsecase addProductUsecase;
  AddProductBloc({required this.addProductUsecase}) : super(const AddProductState()) {
    on<OnNamedChanged>(_nameChange);
    on<OnDescriptionChanged>(_descriptionChange);
    on<OnImageChanged>(_imageChange);
    on<OnPriceChanged>(_priceChange);
    on<OnSubmit>(_submit);
  }

  FutureOr<void> _nameChange(
      OnNamedChanged event, Emitter<AddProductState> emit) {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _descriptionChange(
      OnDescriptionChanged event, Emitter<AddProductState> emit) {
    emit(state.copyWith(description: event.description));
  }

  FutureOr<void> _imageChange(
      OnImageChanged event, Emitter<AddProductState> emit) {
    emit(state.copyWith(imageUrl: event.imageUrl));
  }

  FutureOr<void> _priceChange(
      OnPriceChanged event, Emitter<AddProductState> emit) {
    emit(state.copyWith(price: event.price));
  }

  FutureOr<void> _submit(OnSubmit event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(status: AddProductPageStatus.loading));
    final product = ProductEntity(
      name: state.name,
      description: state.description,
      imageUrl: state.imageUrl,
      price: state.price.toInt(),
    );
    try {
      final either = await addProductUsecase.execute(product);
      
      either.fold((failure) {
        print("failed bloc");
        emit(state.copyWith(status: AddProductPageStatus.failure));
      }, (success) {
        print("success bloc");
        emit(state.copyWith(status: AddProductPageStatus.success));
      });
    } catch (e) {
      print("error bloc $e");
      emit(state.copyWith(status: AddProductPageStatus.failure));
    }
  }
}
