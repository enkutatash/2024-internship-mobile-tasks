import 'package:ecommerce/features/auth/domain/entity/user_entity.dart';


class UserModelNoPass extends UserEntity {
  UserModelNoPass({
    required String name,
    required String email,
   
  }) : super(name: name, email: email);

  factory UserModelNoPass.fromJson(Map<String, dynamic> json) {
    return UserModelNoPass(
      name: json['name'],
      email: json['email'],
      
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'name': name,
      'email': email,
     
    };
  }

factory UserModelNoPass.fromEntity(UserEntity entity) {
    return UserModelNoPass(
      name: entity.name,
      email: entity.email,
    );
  }

}