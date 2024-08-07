import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecase/delete_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../analysis_options.yaml';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository mockProductRepository;
  late DeleteProductUsecase deleteProductUsecase;
  setUp(() {
    mockProductRepository = MockProductRepository();
    deleteProductUsecase =
        DeleteProductUsecase(productRepository: mockProductRepository);
  });

  const String productId = "6672752cbd218790438efdb0";
  var product = ProductEntity(
      id: "6672752cbd218790438efdb0",
      name: "Anime website",
      description: "Explore anime characters.",
      price: 123,
      imageUrl:
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg");

  test("Product should deleted", () async {
    // arrange
    when(() => mockProductRepository.deleteProduct(productId))
        .thenAnswer((_) async => Right(product));

    // act
    final result = await deleteProductUsecase.execute(productId);

    // expect
    result.fold(
        (failure) =>
            Left(Failure(message: "Product with this id doesn't exist")),
        (success) {
      expect(result,isA<Right>());
    });
  });
}
