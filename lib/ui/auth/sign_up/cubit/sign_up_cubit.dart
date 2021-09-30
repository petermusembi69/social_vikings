import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soc/models/_index.dart';
import 'package:soc/services/_index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required AuthService authService,
  }) : super(const SignUpState.initial()) {
    _authService = authService;
  }

  late AuthService _authService;

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    emit(const SignUpState.loading());
    try {
      final dynamic _result = await _authService.createUserWithEmailAndPassword(
        SignInDTO(
          email: email,
          password: password,
        ),
      );
      Logger().e(_result);

      if (_result is User) {
        emit(const SignUpState.loaded());
      } else if (_result is String) {
        emit(SignUpState.error(_result));
      } else {
        emit(const SignUpState.error('Sign Up Failed!'));
      }
    } catch (e) {
      emit(const SignUpState.error('Sign Up Failed!'));
    }
  }

  void reset() {
    emit(const SignUpState.initial());
  }
}