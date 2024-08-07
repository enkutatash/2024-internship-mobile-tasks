import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// test added product is entity type
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository mockProductRepository;
  late AddProductUsecase addProductUsecase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    addProductUsecase =
        AddProductUsecase(productRepository: mockProductRepository);
  });

  final product = ProductEntity(
    id: "unique-id",
    name: "New Product",
    description: "Product description",
    price: 100,
    imageUrl: "http://example.com/image.jpg",
  );

  test("should return product entity type ", () async {
    // arrange
    when(() => mockProductRepository.addProduct(product))
        .thenAnswer((_) async => Right(product));

    // act

    final result = await addProductUsecase.execute(product);

    // assert

    expect(result, Right(product));
  });
}
