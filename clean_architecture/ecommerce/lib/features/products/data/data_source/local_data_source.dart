import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/products/data/data_source/local_source.dart';
import 'package:ecommerce/features/products/data/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource extends LocalSource {
  final SharedPreferences sharedPreferences;

  LocalDataSource({required this.sharedPreferences});

  @override
  Future<Either<Failure, List<ProductModel>>> getSavedProducts() async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();

      String? productsjson = sharedPreferences.getString('productslist');
      if (productsjson == null) {
        return const Right([]);
      }
      List<Map<String, dynamic>> productMap = jsonDecode(productsjson);
      List<ProductModel> products = [];
      for (var product in productMap) {
        products.add(ProductModel.fromjson(product));
      }
      return Right(products);
    } catch (e) {
      return Left(Failure(message: "Failed to get saved products"));
    }
  }

  @override
  Future<Either<Failure, void>> saveData(List<ProductModel> products) async {
    try {
      final productsjson = [];
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      for (var product in products) {
        productsjson.add(product.toJson());
      }
      String jsonString = jsonEncode(productsjson);
      sharedPreferences.setString('productslist', jsonString);
      return Future.value(const Right(null));
    } catch (e) {
      return Left(Failure(message: "Failed to cache data"));
    }
  }
}
