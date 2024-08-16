import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/auth/data_layer/data_source/local_abstract.dart';
import 'package:ecommerce/features/auth/data_layer/model/user_model.dart';
import 'package:ecommerce/features/auth/data_layer/model/user_model_no_pass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceUser extends LocalAbstract {
  SharedPreferences sharedPreferences;
  LocalDataSourceUser({required this.sharedPreferences});

  @override
  Future<Either<Failure, UserModelNoPass>> getUser(String email) async {
    try {
      var userData = sharedPreferences.getString('access_token');

      if (userData != null && userData.isNotEmpty) {
        Map<String, dynamic> userMap = jsonDecode(userData);

        var user = UserModelNoPass.fromJson(userMap);
        if(user.email == email){

        return Right(user);
        }
        return Left(Failure(message: "User not found"));
      } else {
        return Left(Failure(message: "Access token not found"));
      }
    } catch (e) {
      return Left(Failure(message: "Failed to get user: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, void>> saveUser(UserModelNoPass user) async {
    try {
      String userJson = jsonEncode(user.toJson());

      await sharedPreferences.setString('access_token', userJson);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: "Failed to save user: ${e.toString()}"));
    }
  }
}
