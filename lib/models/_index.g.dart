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
