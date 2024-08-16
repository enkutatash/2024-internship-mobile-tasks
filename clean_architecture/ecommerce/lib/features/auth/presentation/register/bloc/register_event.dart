part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class NameChanged extends RegisterEvent {
  final String name;

  NameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class EmailChanged extends RegisterEvent {
  final String email;

  EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends RegisterEvent {
  final String password;

  PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;

  ConfirmPasswordChanged({required this.confirmPassword});

  @override
  List<Object> get props => [confirmPassword];
}

class RegisterSubmitted extends RegisterEvent {
  RegisterSubmitted();

  @override
  List<Object> get props => [];
}

class CheckBoxEvent extends RegisterEvent {
  final bool isChecked;

  CheckBoxEvent({required this.isChecked});

  @override
  List<Object> get props => [isChecked];
}

class LoginEvent extends RegisterEvent {
 


  @override
  List<Object> get props => [];
}