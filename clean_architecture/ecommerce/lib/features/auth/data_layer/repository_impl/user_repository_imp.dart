import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/core/network/network.dart';
import 'package:ecommerce/features/auth/data_layer/data_source/local_abstract.dart';
import 'package:ecommerce/features/auth/data_layer/data_source/remote_abstract.dart';
import 'package:ecommerce/features/auth/data_layer/model/user_model.dart';
import 'package:ecommerce/features/auth/data_layer/model/user_model_no_pass.dart';
import 'package:ecommerce/features/auth/domain/entity/user_entity.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';

class UserRepositoryImp implements AuthRepository {
  NetworkInfo networkInfo;
  LocalAbstract localAbstract;
  RemoteAbstract remoteAbstract;
  UserRepositoryImp({
    required this.networkInfo,
    required this.localAbstract,
    required this.remoteAbstract,
  });

  @override
  Future<Either<Failure, UserModelNoPass>> login(
      String email, String password) async {
    try {
      var user = await localAbstract.getUser();
      if (user.isRight()) {
        return Right(user.getOrElse(() => throw Exception('User not found')));
      } else {
        if (await networkInfo.isConnected) {
          var tokenResult = await remoteAbstract.getToken(email, password);

          return await tokenResult.fold((failure) {
            return Left(Failure(message: "User has not registered"));
          }, (token) async {
            var userResult = await remoteAbstract.getUser(token);

            return await userResult.fold((failure) {
              return Left(Failure(message: "User has not registered"));
            }, (userData) async {
              await localAbstract.saveUser(userData);
              return Right(userData);
            });
          });
        } else {
          return Left(Failure(message: "No internet connection"));
        }
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
@override
Future<Either<Failure, UserModel>> register(UserEntity user) async {
  try {
    if (await networkInfo.isConnected) {
      await remoteAbstract.register(UserModel.fromEntity(user));
      

      var tokenResult = await remoteAbstract.getToken(user.email, user.password!);
      return await tokenResult.fold((failure) async {

        return Left(Failure(message: "User has not registered"));
      }, (token) async {

        var userDataResult = await remoteAbstract.getUser(token);
        return await userDataResult.fold((failure) async {

          return Left(Failure(message: "User has not registered"));
        }, (userData) async {

          await localAbstract.saveUser(userData);
          return Right(UserModel.fromEntity(user));
        });
      });
    } else {
      return Left(Failure(message: "No internet connection"));
    }
  } catch (e) {
    print("Error: reg in repo $e");
    return Left(Failure(message: e.toString()));
  }
}

}
