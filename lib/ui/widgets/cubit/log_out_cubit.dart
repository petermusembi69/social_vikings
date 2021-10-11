import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soc/services/_index.dart';

part 'log_out_state.dart';
part 'log_out_cubit.freezed.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit({
    required AuthService authService,
    required HiveService hiveService,
  }) : super(const LogOutState.initial()) {
    _authService = authService;
    _hiveService = hiveService;
  }

  late AuthService _authService;
  late HiveService _hiveService;

  Future<void> logOut() async {
    emit(const LogOutState.loading());
    try {
      await _authService.signOut();
      _hiveService.clearPrefs();
      emit(const LogOutState.loaded());
    } catch (e) {
      emit(const LogOutState.error('Log out Failed!'));
    }
  }

  void reset() {
    emit(const LogOutState.initial());
  }
}
