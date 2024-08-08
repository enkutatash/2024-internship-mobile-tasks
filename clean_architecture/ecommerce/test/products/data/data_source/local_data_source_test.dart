import 'dart:convert';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/data/data_source/local_data_source.dart';
import 'package:ecommerce/features/products/data/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreference extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreference mockSharedPreference;
  late LocalDataSource localDataSource;

  setUp(() {
    mockSharedPreference = MockSharedPreference();
    localDataSource = LocalDataSource(sharedPreferences: mockSharedPreference);
    // localDataSource = LocalDataSource();

  });

  var jsonproducts = [
    {
      "id": "66b0b23928f63adda72ab38a",
      "name": "PC",
      "description": "long description",
      "price": 123,
      "imageUrl":
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1722855993/images/soyhb68osjiemyy2btte.png"
    },
  ];

  var ans = ProductModel(
      id: "66b0b23928f63adda72ab38a",
      name: "PC",
      imageUrl:
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1722855993/images/soyhb68osjiemyy2btte.png",
      price: 123,
      description: "long description");

  test("should return list of product model cached before", () async {
    //  arrange
    when(() => mockSharedPreference.getString('productslist'))
        .thenReturn(jsonproducts.toString());
    //  act
    final res = await localDataSource.getSavedProducts();
    //  assert
    res.fold(
        (left) => Failure(message: "Failed to get saved products"),
        (r) => {
              expect(r, [ans])
            });
  });

  //  arrange
  test("should cache data", () async {
    when(() => mockSharedPreference.setString(
            'productslist', any()))
        .thenAnswer((_) async => (true));
    //  act
    final res = await localDataSource.saveData([ans]);

    //  assert
    expect(res, isA<Right>());
  });
}
