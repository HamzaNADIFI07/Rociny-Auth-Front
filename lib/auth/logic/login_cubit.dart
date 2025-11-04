import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../data/auth.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _repo;

  LoginCubit(this._repo) : super(const LoginState());

  void emailChanged(String v) => emit(state.copyWith(email: v));
  void passwordChanged(String v) => emit(state.copyWith(password: v));

  Future<void> submitted() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress, error: null));
    try {
      await _repo.login(email: state.email.trim(), password: state.password);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        error: 'Identifiants invalides',
      ));
    }
  }
}
