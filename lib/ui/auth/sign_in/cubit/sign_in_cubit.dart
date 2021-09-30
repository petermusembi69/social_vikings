import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:soc/models/_index.dart';
import 'package:soc/services/_index.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required AuthService authService,
  }) : super(const SignInState.initial()) {
    _authService = authService;
  }

  late AuthService _authService;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(const SignInState.loading());
    try {
      Logger().e('jjij');
      final dynamic _result = await _authService.signInWithEmailAndPassword(
        SignInDTO(
          email: email,
          password: password,
        ),
      );
      if (_result is User) {
        emit(const SignInState.loaded());
      } else if (_result is String) {
        emit(SignInState.error(_result));
      }
    } catch (e) {
      emit(const SignInState.error('Login Failed!'));
    }
  }

  void reset() {
    emit(const SignInState.initial());
  }
}
