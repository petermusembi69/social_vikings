// GENERATED CODE - DO NOT MODIFY BY HAND

part of social_models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInDTO _$_$_SignInDTOFromJson(Map<String, dynamic> json) {
  return _$_SignInDTO(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$_$_SignInDTOToJson(_$_SignInDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$_MemberAuthDTO _$_$_MemberAuthDTOFromJson(Map<String, dynamic> json) {
  return _$_MemberAuthDTO(
    name: json['name'] as String?,
    email: json['email'] as String,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$_$_MemberAuthDTOToJson(_$_MemberAuthDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
    };
