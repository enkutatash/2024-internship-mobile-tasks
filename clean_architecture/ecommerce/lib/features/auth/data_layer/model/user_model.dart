import 'package:ecommerce/features/auth/domain/entity/user_entity.dart';


class UserModel extends UserEntity {
  UserModel({
    required String name,
    required String email,
    required String password,
  }) : super(name: name, email: email, password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
    );
  }

}