import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/auth/data_layer/model/user_model.dart';

abstract class LocalAbstract {
   Future<Either<Failure, UserModel>> getUser();
  Future<Either<Failure,void>> saveUser(UserModel user);
}
