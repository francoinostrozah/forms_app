import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void onSubmit() async {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty(value: state.username.value),
        password: Password.dirty(value: state.password.value),
        isValid: Formz.validate([
          state.username,
          state.password,
          //state.email
        ])));
  }

  void userNameChanged(value) {
    final username = Username.dirty(value: value);

    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password])));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value: value);

    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username])));
  }
}
