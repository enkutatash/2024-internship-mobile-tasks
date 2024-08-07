import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';

class UpdateProductUsecase {
  ProductRepository productRepository;
  UpdateProductUsecase({required this.productRepository});
  Future<Either<Failure, ProductEntity>> execute(ProductEntity product) {
    return productRepository.updateProduct(product);
  }
  
}
