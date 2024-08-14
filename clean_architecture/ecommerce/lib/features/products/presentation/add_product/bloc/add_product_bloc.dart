import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductUsecase addProductUsecase;
  AddProductBloc({
    required this.addProductUsecase,
  }) : super(const AddProductState()) {
    on<AddProductEvent>(_addProduct);
  }

  Future<void> _addProduct(
      AddProductEvent event, Emitter<AddProductState> emit) async{
        emit(state.copyWith(status: AddProductStatus.loading));
        var product = ProductEntity(description: state.description, name: state.name, price: state.price.toInt(), imageUrl: state.imageUrl);
        try{
          await addProductUsecase.execute(product); 
          emit(state.copyWith(status: AddProductStatus.loaded)); 

        }catch(e){
          emit(state.copyWith(status: AddProductStatus.failure));
        }
      }
}
