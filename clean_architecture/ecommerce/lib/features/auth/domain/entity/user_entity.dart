import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String name;
  final String email;
  final String? password;

  UserEntity({
    required this.name,
    required this.email,
    this.password,
   
  });

  @override
  List<Object?> get props => [name, email, password];
}