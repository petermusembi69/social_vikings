import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soc/services/_index.dart';

part 'google_sign_in_state.dart';
part 'google_sign_in_cubit.freezed.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit({
    required AuthService authService,
    required HiveService hiveService,
  }) : super(const GoogleSignInState.initial()) {
    _authService = authService;
    _hiveService = hiveService;
  }

  late AuthService _authService;
  late HiveService _hiveService;

  Future<void> signInwithGoogle() async {
    try {
      final dynamic _result = await _authService.signInWithGoogle();
      if (_result is UserCredential) {
        _hiveService.persistToken(_result.credential!.token!.toString());
        emit(const GoogleSignInState.loaded());
      } else if (_result is String) {
        emit(GoogleSignInState.error(_result));
      }
    } catch (e) {
      emit(const GoogleSignInState.error('Google Sign in Failed!'));
    }
  }

  void reset() {
    emit(const GoogleSignInState.initial());
  }
}
