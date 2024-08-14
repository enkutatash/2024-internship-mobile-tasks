import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/network/network.dart';
import 'package:ecommerce/features/products/data/data_source/local_data_source.dart';
import 'package:ecommerce/features/products/data/data_source/local_source.dart';
import 'package:ecommerce/features/products/data/data_source/remote_api.dart';
import 'package:ecommerce/features/products/data/data_source/remote_data_source.dart';
import 'package:ecommerce/features/products/data/repository/product_repository_imp.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/delete_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_all_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/update_product_usecase.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final locator = GetIt.instance;
Future<void> setUp() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  // Register NetworkInfo with NetworkInfoImpl
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImple(
        connectionChecker: locator<InternetConnectionChecker>()),
  );
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  locator.registerLazySingleton<LocalSource>(
    () => LocalDataSource(sharedPreferences: locator<SharedPreferences>()),
  );
  locator
      .registerLazySingleton<Api>(() => RemoteDataSource(dio: locator<Dio>()));
  locator.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(
      api: locator<Api>(),
      networkInfo: locator<NetworkInfo>(),
      localSource: locator<LocalSource>()));
  locator.registerLazySingleton<AddProductUsecase>(
      () => AddProductUsecase(productRepository: locator<ProductRepository>()));
  locator.registerLazySingleton<GetAllProductUsecase>(() =>
      GetAllProductUsecase(productRepository: locator<ProductRepository>()));
  locator.registerLazySingleton<GetProductUsecase>(
      () => GetProductUsecase(productRepository: locator<ProductRepository>()));
  locator.registerLazySingleton<DeleteProductUsecase>(() =>
      DeleteProductUsecase(productRepository: locator<ProductRepository>()));
  locator.registerLazySingleton<UpdateProductUsecase>(() =>
      UpdateProductUsecase(productRepository: locator<ProductRepository>()));

  locator.registerLazySingleton<HomePageBloc>(()=>HomePageBloc(
    updateProductUsecase: locator<UpdateProductUsecase>(),
    addProductUsecase: locator<AddProductUsecase>(),
    deleteProductUsecase: locator<DeleteProductUsecase>(),
    getAllProductUsecase: locator<GetAllProductUsecase>(),
  ));
}
