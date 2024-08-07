import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/core/network/network.dart';
import 'package:ecommerce/features/products/data/data_source/local_source.dart';
import 'package:ecommerce/features/products/data/data_source/remote_api.dart';
import 'package:ecommerce/features/products/data/model/product_model.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  Api api;
  NetworkInfo networkInfo;
  LocalSource localSource;
  ProductRepositoryImp(
      {required this.api,
      required this.networkInfo,
      required this.localSource});
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      var res = await api.getAllProducts();
      var oldProduct = await localSource.getSavedProducts();
      localSource.saveData(res.getOrElse(() => oldProduct.getOrElse(() => [])));
      return res;
    }

    return localSource.getSavedProducts();
  }

  Future<Either<Failure, ProductModel>> getProduct(id) async {
    if (await networkInfo.isConnected) {
      var res = await api.getProduct(id);
      return res;
    }

    return Left(Failure(message: "No Internet Connection"));
  }

  Future<Either<Failure, ProductModel>> addProduct(product) async {
    if (await networkInfo.isConnected) {
      var res = await api.addProduct(product);
      return res;
    }
    return Left(Failure(message: "No Internet Connection"));
  }

  Future<Either<Failure, ProductModel>> updateProduct(product) async {
    if (await networkInfo.isConnected) {
      var res = await api.updateProduct(product);
      return res;
    }
    return Left(Failure(message: "No Internet Connection"));
  }

  Future<Either<Failure, void>> deleteProduct(productId) async {
    if (await networkInfo.isConnected) {
      var res = api.deleteProduct(productId);
      return res;
    }
    return Left(Failure(message: "No Internet Connection"));
  }
}
