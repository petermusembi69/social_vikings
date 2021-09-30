part of social_models;

@freezed
class SignInDTO with _$SignInDTO {
  factory SignInDTO({
    required String email,
    required String password,
  }) = _SignInDTO;

  factory SignInDTO.fromJson(Map<String, dynamic> json) =>
      _$SignInDTOFromJson(json);
}

@freezed
class AuthResult with _$AuthResult {
  factory AuthResult(
    AuthTokenResult data,
    bool success,
  ) = _AuthResult;

  factory AuthResult.fromJson(Map<String, dynamic> json) =>
      _$AuthResultFromJson(json);
}

@freezed
class AuthTokenResult with _$AuthTokenResult {
  factory AuthTokenResult(
    @JsonKey(name: 'phone_number') String phoneNumber,
    String token,
    @JsonKey(name: 'token_type') String tokenType, {
    @JsonKey(name: 'expires_in') int? expiresIn,
  }) = _AuthTokenResult;

  factory AuthTokenResult.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResultFromJson(json);
}

@freezed
class SignUpDTO with _$SignUpDTO {
  factory SignUpDTO({
    @JsonKey(name: 'country_id') required String countryId,
    required String name,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String password,
  }) = _SignUpDTO;

  factory SignUpDTO.fromJson(Map<String, dynamic> json) =>
      _$SignUpDTOFromJson(json);
}
