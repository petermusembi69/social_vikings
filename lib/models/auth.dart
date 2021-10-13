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
class MemberAuthDTO with _$MemberAuthDTO {
  factory MemberAuthDTO({
    required String? name,
    required String email,
    required String? image,
  }) = _MemberAuthDTO;

  factory MemberAuthDTO.fromJson(Map<String, dynamic> json) =>
      _$MemberAuthDTOFromJson(json);
}

class MemberAuthAdapter extends TypeAdapter<MemberAuthDTO> {
  @override
  final typeId = 0;

  @override
  MemberAuthDTO read(BinaryReader reader) {
    return MemberAuthDTO.fromJson(
        Map<String, dynamic>.of(json.decode(reader.read())));
  }

  @override
  void write(BinaryWriter writer, MemberAuthDTO obj) {
    writer.write(json.encode(obj.toJson()));
  }
}
