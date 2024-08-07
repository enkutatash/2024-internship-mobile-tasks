import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/products/data/model/product_model.dart';

import '../../../../core/failure/failure.dart';

abstract class LocalSource {
  Future<Either<Failure, List<ProductModel>>> getSavedProducts();
  Future<Either<Failure, void>> saveData(List<ProductModel> products);
}
