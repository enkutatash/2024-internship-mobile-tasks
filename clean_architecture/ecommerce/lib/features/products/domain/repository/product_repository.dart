import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, ProductEntity>> getProduct(id);
  Future<Either<Failure, ProductEntity>> addProduct(product);
  Future<Either<Failure, ProductEntity>> updateProduct(product);
  Future<Either<Failure, void>> deleteProduct(productId);
}
