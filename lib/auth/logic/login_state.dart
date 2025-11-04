import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final FormzSubmissionStatus status; // initial - inProgress - success - failure
  final String? error;

  const LoginState({
    this.email = '',
    this.password = '',
    this.status = FormzSubmissionStatus.initial,
    this.error,
  });

  LoginState copyWith({
    String? email,
    String? password,
    FormzSubmissionStatus? status,
    String? error,
  }) => LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      error: error,
    );

  @override
  List<Object?> get props => [email, password, status, error];
}
