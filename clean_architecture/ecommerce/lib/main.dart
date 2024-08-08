import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/network/network.dart';
import 'package:ecommerce/features/products/data/data_source/local_data_source.dart';
import 'package:ecommerce/features/products/data/data_source/remote_api.dart';
import 'package:ecommerce/features/products/data/data_source/remote_data_source.dart';
import 'package:ecommerce/features/products/data/model/product_model.dart';
import 'package:ecommerce/features/products/data/repository/product_repository_imp.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_all_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/update_product_usecase.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? _image;
  String imagePath = '';

  late final RemoteDataSource remoteDataSource;
  late final ProductRepositoryImp productRepository;
  late final AddProductUsecase addProductUsecase;
  late final GetAllProductUsecase getAllProductUsecase;

  @override
  void initState() {
    super.initState();
    _initializeDependencies();
  }

  Future<void> _initializeDependencies() async {
    remoteDataSource = RemoteDataSource(dio: Dio());
    final sharedPreferences = await SharedPreferences.getInstance();
    LocalDataSource localDataSource = LocalDataSource(sharedPreferences: sharedPreferences);
    productRepository = ProductRepositoryImp(
      api: remoteDataSource,
      networkInfo: NetworkInfoImple(connectionChecker: InternetConnectionChecker()),
      localSource: localDataSource,
    );
    addProductUsecase = AddProductUsecase(productRepository: productRepository);
    getAllProductUsecase = GetAllProductUsecase(productRepository: productRepository);
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        imagePath = pickedFile.path;
      });
    } else {
      debugPrint('No image selected.');
    }
  }

  Future<void> _addProduct() async {
    if (_image != null) {
      final product = ProductModel.fromjson({
        "id": "66b0b23928f63adda72ab3900",
        "name": "DIO",
        "description": "Explore phone.",
        "price": 800,
        "imageUrl": imagePath,
      });
      final result = await addProductUsecase.execute(product);
      debugPrint(result.toString());
    } else {
      debugPrint('No image selected.');
    }
  }

  Future<void> _getAllProducts() async {
    final products = await getAllProductUsecase.execute();
    debugPrint(products.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Product Manager')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text("Select Image"),
            ),
            ElevatedButton(
              onPressed: _addProduct,
              child: const Text("Add Product"),
            ),
            ElevatedButton(
              onPressed: _getAllProducts,
              child: const Text("Get All Products"),
            ),
          ],
        ),
      ),
    );
  }
}