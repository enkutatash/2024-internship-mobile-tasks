import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecase/get_all_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Test the function is called once and the data is not changed


class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository mockProductRepository;
  late GetAllProductUsecase getAllProductUsecase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getAllProductUsecase =
        GetAllProductUsecase(productRepository: mockProductRepository);
  });

  var productlist = <ProductEntity>[];

  test('should return the list of product entity', () async {
    // Arrange
    when(() => mockProductRepository.getAllProducts())
        .thenAnswer((_) async => Right(productlist));

    // Act
    final result = await getAllProductUsecase.execute();

    // Assert
    expect(result, Right(productlist));
    verify(() => mockProductRepository.getAllProducts());
    verifyNoMoreInteractions(mockProductRepository);
  });
}
