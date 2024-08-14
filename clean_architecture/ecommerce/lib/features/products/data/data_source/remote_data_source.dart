import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/data/data_source/remote_api.dart';
import 'package:ecommerce/features/products/data/model/product_model.dart';

import 'package:http_parser/http_parser.dart';

class RemoteDataSource extends Api {
  final Dio dio;
  RemoteDataSource({required this.dio});

  @override
  Stream<List<ProductModel>> getAllProducts() async* {
    try {
      final response = await dio.get('$apiKey/products');

      if (response.statusCode == 200) {
        final List<ProductModel> products = [];
        final Map<String, dynamic> data = response.data;

        final product = data['data'];
        product.forEach((element) {
          products.add(ProductModel.fromjson(element));
        });

        yield products;
      } else {
        print("Failed to fetch products");
        yield [];
      }
    } catch (e) {
      print("Error occurred: $e");
      yield [];
    }
  }

  @override
  Future<Either<Failure, ProductModel>> addProduct(ProductModel product) async {
    try {
      File imageFile = File(product.imageUrl);
      List<int> imageBytes = await imageFile.readAsBytes();

      FormData formData = FormData.fromMap({
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'image': MultipartFile.fromBytes(
          imageBytes,
          filename: 'images.png',
          contentType: MediaType('image', 'png'),
        ),
      });

      final response = await dio.post('$apiKey/products', data: formData);
      if (response.statusCode == 201) {
        print("added");
        return Right(product);
      } else {
        return Left(Failure(message: "Failed to add  product"));
      }
    } catch (e) {
      print("error");
      return Left(Failure(message: "$e Failed to Add  Data"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    try {
      final response = await dio.delete('$apiKey/products/$id');
      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(Failure(message: "Failed to delete product"));
      }
    } catch (e) {
      return Left(Failure(message: "$e Failed to Delete Data"));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProduct(String id) async {
    try {
      final response = await dio.get('$apiKey/products/$id');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final product = data['data'];

        return Right(ProductModel.fromjson(product));
      } else {
        return Left(Failure(message: "Failed to fetch product"));
      }
    } catch (e) {
      return Left(Failure(message: "$e Failed to fetch Data"));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateProduct(
      ProductModel product) async {
    try {
      final response = await dio.put('$apiKey/products/${product.id}',
          data: product.forApi());
      print("from api ${response.data}");
      if (response.statusCode == 200) {
        return Right(product);
      } else {
        print(" failed ${response.statusCode}");
        return Left(Failure(message: "Failed to update product"));
      }
    } catch (e) {
      return Left(Failure(message: "$e Failed to Update Data"));
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
