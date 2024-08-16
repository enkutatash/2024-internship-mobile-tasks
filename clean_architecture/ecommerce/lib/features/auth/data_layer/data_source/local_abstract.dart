import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/auth/data_layer/model/user_model.dart';
import 'package:ecommerce/features/auth/data_layer/model/user_model_no_pass.dart';

abstract class LocalAbstract {
   Future<Either<Failure, UserModelNoPass>> getUser(String email);
  Future<Either<Failure,void>> saveUser(UserModelNoPass user);
}
