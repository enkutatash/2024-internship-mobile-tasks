import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecase/get_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// test the product with that id is returned
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository mockProductRepository;
  late GetProductUsecase getProductUsecase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getProductUsecase =
        GetProductUsecase(productRepository: mockProductRepository);
  });

  const String productId = "6672752cbd218790438efdb0";
  var product = ProductEntity(
      id: "6672752cbd218790438efdb0",
      name: "Anime website",
      description: "Explore anime characters.",
      price: 123,
      imageUrl:
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg");
  test('should return the product with that id', () async {
    // arrange
    when(() => mockProductRepository.getProduct(productId))
        .thenAnswer((_) async => Right(product));

    // act
    final result = await getProductUsecase.execute(productId);

    // assert

    result.fold(
      (failure) => fail('Expected a Right result, but got a Left result'),
      (returnedProduct) {
        expect(result, Right(product));
        expect(returnedProduct, isA<ProductEntity>());
        expect(returnedProduct.id, equals(productId));
      },
    );
    verify(() => mockProductRepository.getProduct(productId)).called(1);
    verifyNoMoreInteractions(mockProductRepository);
  });
}
