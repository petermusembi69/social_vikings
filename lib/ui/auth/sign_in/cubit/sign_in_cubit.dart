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
    required HiveService hiveService,
  }) : super(const SignInState.initial()) {
    _authService = authService;
    _hiveService = hiveService;
  }

  late AuthService _authService;
  late HiveService _hiveService;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(const SignInState.loading());
    try {
      final dynamic _result = await _authService.signInWithEmailAndPassword(
        SignInDTO(
          email: email,
          password: password,
        ),
      );
      if (_result is User) {
        _hiveService.persistToken(_result.uid);
        emit(const SignInState.loaded());
      } else if (_result is String) {
        emit(SignInState.error(_result));
      }
    } catch (e) {
      emit(const SignInState.error('Login Failed!'));
    }
  }

  Future<void> signInwithGoogle() async {
    try {
      final dynamic _result = await _authService.signInWithGoogle();
      Logger().d(_result);
      if (_result is User) {
        _hiveService.persistToken(_result.uid);
        emit(const SignInState.loaded());
      } else if (_result is String) {
        emit(SignInState.error(_result));
      }
    } catch (e) {
      Logger().d(e.toString());

      emit(const SignInState.error('Sign in Failed!'));
    }
  }

  void reset() {
    emit(const SignInState.initial());
  }
}
