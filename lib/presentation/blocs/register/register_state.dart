part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final String email;
  final Password password;

  const RegisterState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.username = const Username.pure(),
      this.email = '',
      this.password = const Password.pure()});

  RegisterState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    String? email,
    Password? password,
  }) =>
      RegisterState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [formStatus, username, email, password];
}
