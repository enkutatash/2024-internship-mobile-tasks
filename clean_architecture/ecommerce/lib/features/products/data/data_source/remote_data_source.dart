import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/data/data_source/remote_api.dart';
import 'package:ecommerce/features/products/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource extends Api {
  @override
Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
  try {
    final response = await http.get(Uri.parse('$apiKey/products'));

    if (response.statusCode == 200) {
      final List<ProductModel> products = [];
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> productList = data['data'];

      for (var element in productList) {
        products.add(ProductModel.fromjson(element));
      }

      return Right(products);
    } else {
      return Left(Failure(message: "Failed to fetch: ${response.reasonPhrase}"));
    }
  } catch (e) {
    return Left(Failure(message: "$e Failed to fetch Data"));
  }
}


  @override
  Future<Either<Failure, ProductModel>> addProduct(ProductModel product) async {
    try {

      var request = http.MultipartRequest('POST', Uri.parse('$apiKey/products'));
      request.fields.addAll({
        'name': product.name,
        'description': product.description,
        'price': product.price.toString()
      });

      request.files.add(await http.MultipartFile.fromPath(
        'image',
        product.imageUrl,
        contentType: MediaType('image', 'jpeg'),
      ));

      http.StreamedResponse response = await request.send();
      
      if (response.statusCode == 201) {
        return Right(product);
      } else {
        return Left(Failure(message: "Failed to add  product"));
      }
    } catch (e) {
      print("error $e");
      return Left(Failure(message: "$e Failed to Add  Data"));
    }
  }

  @override
Future<Either<Failure, void>> deleteProduct(String id) async {
  try {
    final response = await http.delete(Uri.parse('$apiKey/products/$id'));

    if (response.statusCode == 200) {
      return const Right(null);
    } else {
      return Left(Failure(message: "Failed to delete product: ${response.reasonPhrase}"));
    }
  } catch (e) {
    return Left(Failure(message: "$e Failed to Delete Data"));
  }
}

 @override
Future<Either<Failure, ProductModel>> getProduct(String id) async {
  try {
    final response = await http.get(Uri.parse('$apiKey/products/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final product = data['data'];

      return Right(ProductModel.fromjson(product));
    } else {
      return Left(Failure(message: "Failed to fetch product: ${response.reasonPhrase}"));
    }
  } catch (e) {
    return Left(Failure(message: "$e Failed to fetch Data"));
  }
}


 @override
Future<Either<Failure, ProductModel>> updateProduct(ProductModel product) async {
  try {
    final response = await http.put(
      Uri.parse('$apiKey/products/${product.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return Right(product);
    } else {
      return Left(Failure(message: "Failed to update product: ${response.reasonPhrase}"));
    }
  } catch (e) {
    return Left(Failure(message: "$e Failed to Update Data"));
  }
}


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
