part of 'log_out_cubit.dart';

@freezed
abstract class LogOutState with _$LogOutState {
  const factory LogOutState.initial() = _Initial;
  const factory LogOutState.loading() = _Loading;
  const factory LogOutState.loaded() = _Loaded;
  const factory LogOutState.error(String error) = _Error;
}
