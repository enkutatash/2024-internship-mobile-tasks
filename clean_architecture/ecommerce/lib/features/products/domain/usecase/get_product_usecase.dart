import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';

class GetProductUsecase {
  ProductRepository productRepository;
  GetProductUsecase({required this.productRepository});

  Future<Either<Failure, ProductEntity>> execute(String id) {
    return productRepository.getProduct(id);
  }
}
