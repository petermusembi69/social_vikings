part of 'facebook_sign_in_cubit.dart';

@freezed
class FacebookSignInState with _$FacebookSignInState {
  const factory FacebookSignInState.initial() = _Initial;
  const factory FacebookSignInState.loading() = _Loading;
  const factory FacebookSignInState.loaded() = _Loaded;
  const factory FacebookSignInState.error(String error) = _Error;
}
