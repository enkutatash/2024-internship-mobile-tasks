
part of 'register_bloc.dart';

enum RegisterStatus { initial, submitting, success, error }
enum FormzStatus { pure, valid, invalid }
class RegisterState extends Equatable {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final RegisterStatus status;
  final FormzStatus formzStatus;

  const RegisterState({
    this.name='',
    this.email='',
    this.password='',
    this.confirmPassword='',
    this.status = RegisterStatus.initial,
    this.formzStatus = FormzStatus.pure,
  });

  
  RegisterState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    RegisterStatus? status,
    FormzStatus? formzStatus,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      formzStatus: formzStatus ?? this.formzStatus,
    );
  }

  @override
  List<Object> get props => [email, password, confirmPassword, status];
}


