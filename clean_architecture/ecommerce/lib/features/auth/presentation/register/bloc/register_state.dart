part of 'register_bloc.dart';

enum RegisterStatus { initial, submitting, success, error }

class RegisterState extends Equatable {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final RegisterStatus status;

  const RegisterState({
    this.name='',
    this.email='',
    this.password='',
    this.confirmPassword='',
    this.status = RegisterStatus.initial,
  });

  
  RegisterState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    RegisterStatus? status,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, confirmPassword, status];
}
