import 'package:dio/dio.dart';
import 'package:ecommerce/features/products/data/data_source/remote_api.dart';
import 'package:ecommerce/features/products/data/data_source/remote_data_source.dart';
import 'package:ecommerce/features/products/data/model/product_model.dart';
import 'package:ecommerce/features/products/data/repository/product_repository_imp.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_all_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/update_product_usecase.dart';
import 'package:flutter/material.dart';

void main() async {
  // final ProductModel product = ProductModel.fromjson(const {
  //   "id": "66b0b23928f63adda72ab39z",
  //   "name": "Smart",
  //   "description": "Explore phone.",
  //   "price": 800,
  //   "imageUrl":"assets/images/aastu.jpg"
  // });

  // RemoteDataSource remoteDataSource = RemoteDataSource(dio: Dio());
  // ProductRepositoryImp productRepository =
  //     ProductRepositoryImp(api: remoteDataSource);
  // AddProductUsecase addProductUsecase =
  //     AddProductUsecase(productRepository: productRepository);
  // print(await addProductUsecase.execute(product));
  
  // GetAllProductUsecase getAllProductUsecase =
  //     GetAllProductUsecase(productRepository: productRepository);
  // print(await getAllProductUsecase.execute());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
