import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/form_validation/form_validation.dart';
import 'package:ecommerce/features/auth/domain/entity/user_entity.dart';
import 'package:ecommerce/features/auth/domain/usecase/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterUsecase registerUsecase;

  RegisterBloc({
    required this.registerUsecase,
  }) : super(RegisterState()) {
    on<RegisterSubmitted>(_register);
    on<NameChanged>(_nameChanges);
    on<EmailChanged>(_emailChanges);
    on<PasswordChanged>(_passwordChanges);
    on<ConfirmPasswordChanged>(_confirmPasswordChanges);
    on<CheckBoxEvent>(_check);
  }
  FutureOr<void> _register(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.submitting));
    print("RegisterSubmitted");
    print("name ${state.name}");
    print("email ${state.email}");
    print("pass ${state.password}");
    print("confirm ${state.confirmPassword}");
    // validation start
    final name = Name.dirty(state.name);
    final email = Email.dirty(state.email);
    final password = Password.dirty(state.password);
    final confirmPassword =
        Confirm.dirty(state.password, state.confirmPassword);
    print("validation");
    print("name ${state.name} ${name.isValid}");
    print("email ${state.email} ${email.isValid}");
    print("pass ${state.password} ${password.isValid}");
    print("confirm ${state.confirmPassword} ${confirmPassword.isValid}");
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
        print("api");
        print(failure);
        emit(state.copyWith(status: RegisterStatus.error));
      }, (user) {
        emit(state.copyWith(status: RegisterStatus.success));
      });
    } else {
      print("invalid");
      emit(state.copyWith(
        name: name.value,
        email: email.value,
        password: password.value,
        confirmPassword: confirmPassword.value,
        status: RegisterStatus.error,
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
}
