import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/form_validation/form_validation.dart';
import 'package:ecommerce/features/auth/domain/entity/user_entity.dart';
import 'package:ecommerce/features/auth/domain/usecase/login_usecase.dart';
import 'package:ecommerce/features/auth/domain/usecase/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterUsecase registerUsecase;
  LoginUsecase loginUsecase;

  RegisterBloc({
    required this.loginUsecase,
    required this.registerUsecase,
  }) : super(RegisterState()) {
    on<RegisterSubmitted>(_register);
    on<LoginEvent>(_login);
    on<NameChanged>(_nameChanges);
    on<EmailChanged>(_emailChanges);
    on<PasswordChanged>(_passwordChanges);
    on<ConfirmPasswordChanged>(_confirmPasswordChanges);
    on<CheckBoxEvent>(_check);
  }
  FutureOr<void> _register(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.submitting));

    // validation start
    final name = Name.dirty(state.name);
    final email = Email.dirty(state.email);
    final password = Password.dirty(state.password);
    final confirmPassword =
        Confirm.dirty(state.password, state.confirmPassword);

    if (name.isValid &&
        email.isValid &&
        password.isValid &&
        confirmPassword.isValid) {
      emit(state.copyWith(
        name: name.value,
        email: email.value,
        password: password.value,
        confirmPassword: confirmPassword.value,
        formzStatus: FormzStatus.valid,
      ));

      // validation end

      final user = UserEntity(
        name: name.value,
        email: email.value,
        password: password.value,
      );
      final result = await registerUsecase.call(user);
      result.fold((failure) {
        emit(state.copyWith(status: RegisterStatus.regfail));
      }, (user) {
        emit(state.copyWith(status: RegisterStatus.success));
      });
    } else {
      emit(state.copyWith(
        name: name.value,
        email: email.value,
        password: password.value,
        confirmPassword: confirmPassword.value,
        formzStatus: FormzStatus.invalid,
      ));
    }
  }

  FutureOr<void> _nameChanges(NameChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
        name: event.name,
        formzStatus: FormzStatus.pure,
        status: RegisterStatus.initial));
  }

  FutureOr<void> _emailChanges(
      EmailChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
        email: event.email,
        formzStatus: FormzStatus.pure,
        status: RegisterStatus.initial));
  }

  FutureOr<void> _passwordChanges(
      PasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
        password: event.password,
        formzStatus: FormzStatus.pure,
        status: RegisterStatus.initial));
  }

  FutureOr<void> _confirmPasswordChanges(
      ConfirmPasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
        confirmPassword: event.confirmPassword,
        formzStatus: FormzStatus.pure,
        status: RegisterStatus.initial));
  }

  FutureOr<void> _check(CheckBoxEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
        isChecked: event.isChecked,
        formzStatus: FormzStatus.pure,
        status: RegisterStatus.initial));
  }

  FutureOr<void> _login(LoginEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.submitting));
    final password = Name.dirty(state.password);
    final email = Email.dirty(state.email);

    if (password.isValid && email.isValid) {
      emit(state.copyWith(
        password: password.value,
        email: email.value,
        formzStatus: FormzStatus.valid,
      ));

      final result = await loginUsecase.call(email.value, password.value);
      result.fold((failure) {
        emit(state.copyWith(status: RegisterStatus.loginfail));
      }, (user) {
        emit(state.copyWith(status: RegisterStatus.success));
      });
    } else {
      emit(state.copyWith(
        password: password.value,
        email: email.value,
        formzStatus: FormzStatus.invalid,
      ));
    }
  }
}
