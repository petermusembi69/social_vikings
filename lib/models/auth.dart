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

}
