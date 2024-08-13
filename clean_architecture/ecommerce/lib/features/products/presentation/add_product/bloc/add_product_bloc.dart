import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductUsecase addProductUsecase;
  AddProductBloc({required this.addProductUsecase}) : super(AddProductState()) {
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
    emit(state.copyWith(status: AddProductStatus.loading));
    final product = ProductEntity(
      name: state.name,
      description: state.description,
      imageUrl: state.imageUrl,
      price: state.price.toInt(),
    );
    try {
      final either = await addProductUsecase.execute(product);

      either.fold((failure) {
        emit(state.copyWith(status: AddProductStatus.failure));
      }, (success) {
        emit(state.copyWith(status: AddProductStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(status: AddProductStatus.failure));
    }
  }
}
