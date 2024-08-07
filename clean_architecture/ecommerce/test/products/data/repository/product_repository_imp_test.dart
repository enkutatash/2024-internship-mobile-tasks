//

import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/network/network.dart';
import 'package:ecommerce/features/products/data/data_source/local_source.dart';
import 'package:ecommerce/features/products/data/data_source/remote_api.dart';
import 'package:ecommerce/features/products/data/model/product_model.dart';
import 'package:ecommerce/features/products/data/repository/product_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApi extends Mock implements Api {}

class MockLocalSource extends Mock implements LocalSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockApi mockApi;
  late ProductRepositoryImp productRepositoryImp;
  late MockLocalSource mocklocalSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockApi = MockApi();
    mocklocalSource = MockLocalSource();
    mockNetworkInfo = MockNetworkInfo();
    productRepositoryImp = ProductRepositoryImp(
        api: mockApi,
        localSource: mocklocalSource,
        networkInfo: mockNetworkInfo);
  });

  var productlist = <ProductModel>[];
  test('get Products should return list of product Model', () async {
    // arrange
    when(() => mockApi.getAllProducts())
        .thenAnswer((_) async => Right(productlist));
    
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    // act
    final result = await productRepositoryImp.getAllProducts();

    // assert
    expect(result, Right(productlist));
    verify(() => mockApi.getAllProducts());
    verifyNoMoreInteractions(mockApi);
  });

  test("should return list of product from local storage", () async {

    when(() => mocklocalSource.getSavedProducts())
        .thenAnswer((_) async => Right(productlist));
    
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

    final result = await productRepositoryImp.getAllProducts();

    
    expect(result, Right(productlist));
    verify(() => mocklocalSource.getSavedProducts());
    verifyNoMoreInteractions(mockApi);

  });
}
