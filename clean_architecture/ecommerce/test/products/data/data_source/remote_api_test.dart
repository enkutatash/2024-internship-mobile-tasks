import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/data/data_source/remote_api.dart';
import 'package:ecommerce/features/products/data/data_source/remote_data_source.dart';
import 'package:ecommerce/features/products/data/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class MockClient extends Mock implements http.Client {}


void main() {
  late MockClient client;
  late RemoteDataSource remoteDataSource;

  setUp(() {
    client = MockClient();
    remoteDataSource = RemoteDataSource();
  });

  var result = {
    "data": [
      {
        "id": "66b0b23928f63adda72ab38a",
        "name": "PC",
        "description": "long description",
        "price": 123,
        "imageUrl":
            "https://res.cloudinary.com/g5-mobile-track/image/upload/v1722855993/images/soyhb68osjiemyy2btte.png"
      }
    ]
  };

  var ans = ProductModel(
      id: "66b0b23928f63adda72ab38a",
      name: "PC",
      imageUrl:
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1722855993/images/soyhb68osjiemyy2btte.png",
      price: 123,
      description: "long description");

  var p = Response(
      requestOptions: RequestOptions(path: '$apiKey/products'),
      data: result,
      statusCode: 200);

  // test("should return product entity type ", () async {
  //   // arrange
  //   when(()=>client.get(Uri.parse('$apiKey/products'))).thenAnswer((_) async => http.Response('{"products": []}', 200));

  //   // act
  //   final res = await remoteDataSource.getAllProducts();

  //   res.fold(
  //       (left) => Failure(message: "fail"),
  //       (r) => {
  //             expect(r, [ans])
  //           });
  // });

  // test('should return failure if no connection', () async {
  //   when(()=>client.get(Uri.parse('$apiKey/products'))).thenThrow(Exception());
  //   final res = await remoteDataSource.getAllProducts();

  //   res.fold((left) => {expect(left, Failure(message: "Exception Failed to fetch Data"))}, (r) => {});
  // });

 
  // test('should return list of products when the response code is 200',
  //       () async {
  //     when(()=>client.get(Uri.parse('$apiKey/products')))
  //         .thenAnswer((_) async => http.Response('{"products": []}', 200));

  //     final result = await remoteDataSource.getAllProducts();

  //     expect(result, ans);
  //   });


  // test('should return failure if no connection for adding product', () async {
  //   when(() => mockDio.post('$apiKey/products',data: ans.toJson())).thenThrow(Exception());
  //   final res = await remoteDataSource.addProduct(ans);

  //   res.fold((left) => {expect(left, Failure(message: "Exception Failed to Add Data"))}, (r) => {});
  // });

  // test('should delete the product with that id', () async {
  //   // Arrange
  //   when(() => mockDio.delete('$apiKey/products/${ans.id}'))
  //       .thenAnswer((_) async => Response(
  //             requestOptions:
  //                 RequestOptions(path: '$apiKey/products/${ans.id}'),
  //             statusCode: 200,
  //           ));

    // Act
  //   final result = await remoteDataSource.deleteProduct(ans.id);

  //   // Assert
  //   expect(result, equals(const Right(null)));
  // });

  // test('should return failure if no connection for deleteing product', () async {
  //   when(() => mockDio.delete('$apiKey/products/${ans.id}')).thenThrow(Exception());
  //   final res = await remoteDataSource.deleteProduct(ans.id);

  //   res.fold((left) => {expect(left, Failure(message: "Exception Failed to Delete Data"))}, (r) => {});
  // });



  // test('should update the product', () async {
  //   when(() => mockDio.put('$apiKey/products/${ans.id}', data: ans.toJson()))
  //       .thenAnswer((_) async => p);
  //   final res = await remoteDataSource.updateProduct(ans);

  //   res.fold((left) => Failure(message: "fail"), (r) => {expect(r, ans)});
  // });

  //  test('should return failure if no connection for updating product', () async {
  //   when(() => mockDio.put('$apiKey/products/${ans.id}', data: ans.toJson())).thenThrow(Exception());
  //   final res = await remoteDataSource.updateProduct(ans);

  //   res.fold((left) => {expect(left, Failure(message: "Exception Failed to Update Data"))}, (r) => {});
  // });


//   test('should return the product model', () async {
//   // Mock successful response
//   when(() => .get('$apiKey/products/${ans.id}')) // Use mockDio.get
//     .thenAnswer((_) async => p);

//   final result = await remoteDataSource.getProduct(ans.id);

//   result.fold(
//     (left) => expect(left, isA<Failure>()), // Check for Failure type
//     (right) => expect(right, ans), // Expect the right value to be ans
//   );
// });

  // test('should return failure if no connection for getting product', () async {
  //   when(()=>client.get(Uri.parse('$apiKey/products'))).thenThrow(Exception());
  //   final res = await remoteDataSource.getProduct(ans.id);

  //   res.fold((left) => {expect(left, Failure(message: "Exception Failed to fetch Data"))}, (r) => {});
  // });
}
