import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/auth/data_layer/model/user_model.dart';
import 'package:ecommerce/features/auth/data_layer/model/user_model_no_pass.dart';

abstract class RemoteAbstract {
  Future<Either<Failure,String>> getToken(String email, String password);
  Future<Either<Failure,UserModel>> register(UserModel user);
  Future<Either<Failure,UserModelNoPass>> getUser(String token);
}