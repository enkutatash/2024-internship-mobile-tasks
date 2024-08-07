import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecase/update_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

//  test the updated product have same id with the new product
// the product have type of product entity
// it should return failure when the product not found
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository mockProductRepository;
  late UpdateProductUsecase updateProductUsecase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    updateProductUsecase =
        UpdateProductUsecase(productRepository: mockProductRepository);
  });

  const String productId = "6672752cbd218790438efdb0";
  var product = ProductEntity(
      id: "6672752cbd218790438efdb0",
      name: "Anime website",
      description: "Explore anime characters.",
      price: 123,
      imageUrl:
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg");

  group('update product', () {
    test('should return updated task with same id', () async {
      // arrange
      when(() => mockProductRepository.updateProduct(product))
          .thenAnswer((_) async => Right(product));
      // act
      final result = await updateProductUsecase.execute(product);
      // expect

      result.fold(
          (failure) => fail('Expected a Right result, but got a Left result'),
          (returnedProduct) {
        expect(result, Right(product));
        expect(returnedProduct, isA<ProductEntity>());
        expect(returnedProduct.id, equals(productId));
      });
    });

    test('should return failure when the product is not available', () async {
      // Arrange
      when(() => mockProductRepository.updateProduct(product)).thenAnswer(
          (_) async => Left(Failure(
              message: "Failed to get the product with this product id")));

      // Act
      final result = await updateProductUsecase.execute(product);

      // Assert
      expect(
          result,
          Left(Failure(
              message: "Failed to get the product with this product id")));
    });
  });
}
