import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soc/models/_index.dart';
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
    emit(const FacebookSignInState.loading());

    try {
      final dynamic _result = await _authService.signInWithFacebook();
      if (_result is MemberAuthDTO) {
        _hiveService.persistMemeber(_result);
        emit(const FacebookSignInState.loaded());
      } else if (_result is String) {
        emit(FacebookSignInState.error(_result));
      }
    } catch (e) {
      emit(FacebookSignInState.error(e.toString().split(']').last));
    }
  }

  void reset() {
    emit(const FacebookSignInState.initial());
  }
}
