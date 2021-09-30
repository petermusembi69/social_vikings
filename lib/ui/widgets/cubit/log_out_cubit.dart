import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soc/services/_index.dart';

part 'log_out_state.dart';
part 'log_out_cubit.freezed.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit({
    required AuthService authService,
  }) : super(const LogOutState.initial()) {
    _authService = authService;
  }

  late AuthService _authService;

  Future<void> logOut() async {
    emit(const LogOutState.loading());
    try {
      await _authService.signOut();

      emit(const LogOutState.loaded());
    } catch (e) {
      emit(const LogOutState.error('Log out Failed!'));
    }
  }

  void reset() {
    emit(const LogOutState.initial());
  }
}
