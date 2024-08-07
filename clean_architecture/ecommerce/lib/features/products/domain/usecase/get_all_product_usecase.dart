import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';

class GetAllProductUsecase {
  final ProductRepository productRepository;
  GetAllProductUsecase({required this.productRepository});

  Future<Either<Failure, List<ProductEntity>>> execute() {
    return productRepository.getAllProducts();
  }
}
