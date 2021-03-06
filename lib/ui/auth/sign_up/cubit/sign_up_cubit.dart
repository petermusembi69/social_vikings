import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soc/models/_index.dart';
import 'package:soc/services/_index.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required AuthService authService,
    required HiveService hiveService,
  }) : super(const SignUpState.initial()) {
    _authService = authService;
    _hiveService = hiveService;
  }

  late AuthService _authService;
  late HiveService _hiveService;

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
      if (_result is MemberAuthDTO) {
        _hiveService.persistMemeber(_result);
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
