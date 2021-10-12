import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soc/services/_index.dart';

part 'facebook_sign_in_state.dart';
part 'facebook_sign_in_cubit.freezed.dart';

class FacebookSignInCubit extends Cubit<FacebookSignInState> {
  FacebookSignInCubit({
    required AuthService authService,
    required HiveService hiveService,
  }) : super(const FacebookSignInState.initial()) {
    _authService = authService;
    _hiveService = hiveService;
  }

  late AuthService _authService;
  late HiveService _hiveService;

  Future<void> signInWithFacebook() async {
    try {
      final dynamic _result = await _authService.signInWithFacebook();
      if (_result is UserCredential) {
        _hiveService.persistToken(_result.credential!.token!.toString());
        emit(const FacebookSignInState.loaded());
      } else if (_result is String) {
        emit(FacebookSignInState.error(_result));
      }
    } catch (e) {
      emit(const FacebookSignInState.error('Facebook Sign in Failed!'));
    }
  }

  void reset() {
    emit(const FacebookSignInState.initial());
  }
}
