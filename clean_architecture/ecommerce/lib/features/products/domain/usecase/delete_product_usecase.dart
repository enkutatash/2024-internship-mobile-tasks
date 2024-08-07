import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';

class DeleteProductUsecase {
  ProductRepository productRepository;
  DeleteProductUsecase({required this.productRepository});
  Future<Either<Failure, void>> execute(String productId) {
    return productRepository.deleteProduct(productId);
  }

}
